#pragma comment(lib, "user32.lib")

#include <windows.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#define MW_WIDTH 180
#define MW_HEIGHT 280

#define B_WIDTH 30
#define B_HEIGHT 30

#define EDIT_WIDTH 139
#define EDIT_HEIGHT 30

#define B_POS_X_0 10
#define B_POS_X_1 43
#define B_POS_X_2 76
#define B_POS_X_3 119

#define B_POS_Y_E 10

#define B_POS_Y_0 50
#define B_POS_Y_1 83
#define B_POS_Y_2 116
#define B_POS_Y_3 149
#define B_POS_Y_4 182
#define B_POS_Y_5 215

#define Zero 0
#define Plus 11
#define Minus 12
#define Multiply 13
#define Divide 14
#define Equal 100
#define Point 101
#define Negative 102
#define BackSpace 103
#define ClearLast 104
#define ClearAll 105
#define MemoClear 200
#define MemoRestore 201
#define MemoSave 222
#define About 333

#define buttonWStyle (WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON)

HWND Edit;

const char *buttonNumbers[10] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };

typedef struct {
    LPCTSTR lpWindowName;
    int posX, posY;
    HMENU hmenu;
} TButtonDescription;


const static TButtonDescription buttonDescriptions[] = {
    { "1",   B_POS_X_0, B_POS_Y_4, HMENU(1)           },
    { "2",   B_POS_X_1, B_POS_Y_4, HMENU(2)           },
    { "3",   B_POS_X_2, B_POS_Y_4, HMENU(3)           },
    { "4",   B_POS_X_0, B_POS_Y_3, HMENU(4)           },
    { "5",   B_POS_X_1, B_POS_Y_3, HMENU(5)           },
    { "6",   B_POS_X_2, B_POS_Y_3, HMENU(6)           },
    { "7",   B_POS_X_0, B_POS_Y_2, HMENU(7)           },
    { "8",   B_POS_X_1, B_POS_Y_2, HMENU(8)           },
    { "9",   B_POS_X_2, B_POS_Y_2, HMENU(9)           },
    { "0",   B_POS_X_1, B_POS_Y_5, HMENU(Zero)        },
    { "+",   B_POS_X_3, B_POS_Y_4, HMENU(Plus)        },
    { "-",   B_POS_X_3, B_POS_Y_3, HMENU(Minus)       },
    { "*",   B_POS_X_3, B_POS_Y_2, HMENU(Multiply)    },
    { "/",   B_POS_X_3, B_POS_Y_1, HMENU(Divide)      },
    { "=",   B_POS_X_3, B_POS_Y_5, HMENU(Equal)       },
    { ".",   B_POS_X_2, B_POS_Y_5, HMENU(Point)       },
    { "<-",  B_POS_X_0, B_POS_Y_1, HMENU(BackSpace)   },
    { "CE",  B_POS_X_1, B_POS_Y_1, HMENU(ClearLast)   },
    { "C",   B_POS_X_2, B_POS_Y_1, HMENU(ClearAll)    },
    { "MC",  B_POS_X_0, B_POS_Y_0, HMENU(MemoClear)   },
    { "MR",  B_POS_X_1, B_POS_Y_0, HMENU(MemoRestore) },
    { "MS",  B_POS_X_2, B_POS_Y_0, HMENU(MemoSave)    },
    { "-/+", B_POS_X_0, B_POS_Y_5, HMENU(Negative)    }
};

HWND buttons[sizeof(buttonDescriptions)] = { };

static HWND button_About;

char FirstOperand[32] = { };
char SecondOperand[32] = { };
char MemoOperand[32] = { };

int Operation;

void createButtons(HWND& hwnd, HINSTANCE& hInstance, TButtonDescription const *buttonDescriptions, HWND *buttons, size_t length)
{
    TButtonDescription const *btDescr = buttonDescriptions, *endBtDescr = buttonDescriptions + length;
    HWND *pButton = buttons;

    while (btDescr < endBtDescr) {
        *(pButton++) = CreateWindow(
            "button",
            btDescr -> lpWindowName,
            buttonWStyle,
            btDescr -> posX,
            btDescr -> posY,
            B_WIDTH,
            B_HEIGHT,
            hwnd,
            btDescr -> hmenu,
            hInstance,
            NULL
        );
        btDescr++;
    }
}

LRESULT CALLBACK WndProc(HWND hwnd,
    UINT Message,
    WPARAM wParam,
    LPARAM lParam)
{
    switch (Message) {
    case (WM_CREATE): {
        FirstOperand[0] = 0;
        SecondOperand[0] = 0;
    } break;

    case WM_COMMAND: {
        WORD loWordWParam = LOWORD(wParam);

        if ((loWordWParam >= 0) && (loWordWParam <= 9)) {
            strcat(FirstOperand, buttonNumbers[loWordWParam]);
            SetWindowText(Edit, FirstOperand);
        } else switch (loWordWParam) {

            case Point: {
                if (strstr(FirstOperand, ".") == 0)
                    strcat(FirstOperand, ".");
                SetWindowText(Edit, FirstOperand);
                break;
            }

            case ClearAll: {
                FirstOperand[0] = 0;
                SecondOperand[0] = 0;
                SetWindowText(Edit, FirstOperand);
                break;
            }

            case ClearLast: {
                FirstOperand[0] = 0;
                SetWindowText(Edit, FirstOperand);
                break;
            }

            case Plus: {
                Operation = Plus;
                for (int i = 0; i <= strlen(FirstOperand); i++)
                    SecondOperand[i] = FirstOperand[i];
                FirstOperand[0] = 0;
                SetWindowText(Edit, "");
                break;
            }

            case Minus: {
                Operation = Minus;
                for (int i = 0; i <= strlen(FirstOperand); i++)
                    SecondOperand[i] = FirstOperand[i];
                FirstOperand[0] = 0;
                SetWindowText(Edit, "");
                break;
            }

            case Multiply: {
                Operation = Multiply;
                for (int i = 0; i <= strlen(FirstOperand); i++)
                    SecondOperand[i] = FirstOperand[i];
                FirstOperand[0] = 0;
                SetWindowText(Edit, "");
                break;
            }

            case Divide: {
                Operation = Divide;
                for (int i = 0; i <= strlen(FirstOperand); i++)
                    SecondOperand[i] = FirstOperand[i];
                FirstOperand[0] = 0;
                SetWindowText(Edit, "");
                break;
            }

            case Equal: {
                double _FirstOperand = atof(FirstOperand);
                double _SecondOperand = atof(SecondOperand);
                if (_FirstOperand == 0 && Operation == Divide) {
                    MessageBox(NULL, "Деление на ноль", "ERROR", MB_ICONERROR);
                    FirstOperand[0] = 0;
                    SecondOperand[0] = 0;
                    break;
                }
                FirstOperand[0] = 0;
                SecondOperand[0] = 0;

                if (Operation == Plus) {
                    double FirstOperandDouble = _SecondOperand + _FirstOperand;
                    sprintf(FirstOperand, "%lf", FirstOperandDouble);
                }

                if (Operation == Minus) {
                    double FirstOperandDouble = _SecondOperand - _FirstOperand;
                    sprintf(FirstOperand, "%lf", FirstOperandDouble);
                }

                if (Operation == Multiply) {
                    double FirstOperandDouble = _SecondOperand * _FirstOperand;
                    sprintf(FirstOperand, "%lf", FirstOperandDouble);
                }

                if (Operation == Divide) {
                    double FirstOperandDouble = _SecondOperand / _FirstOperand;
                    sprintf(FirstOperand, "%lf", FirstOperandDouble);
                }

                SetWindowText(Edit, FirstOperand);
                break;
            }

            case Negative: {
                double _FirstOperand = atof(FirstOperand);
                double _SecondOperand = 0;
                double FirstOperandDouble = _SecondOperand - _FirstOperand;
                sprintf(FirstOperand, "%lf", FirstOperandDouble);
                SetWindowText(Edit, FirstOperand);
                break;
            }

            case BackSpace: {
                if (strlen(FirstOperand) > 0) {
                    FirstOperand[strlen(FirstOperand)-1] = 0;
                }
                SetWindowText(Edit, FirstOperand);
                break;
            }

            case MemoClear: {
                MemoOperand[0] = 0;
                break;
            }

            case MemoRestore: {
                for (int i = 0; i <= strlen(MemoOperand); i++) {
                    FirstOperand[i] = MemoOperand[i];
                }
                SetWindowText(Edit, FirstOperand);
                break;
            }

            case MemoSave: {
                for (int i = 0; i <= strlen(MemoOperand); i++) {
                    MemoOperand[i] = FirstOperand[i];
                }
                break;
            }

            case About: {
                MessageBox(NULL, "Calculator 1.0 \nTest App Co. Ltd, 2019", "About",
                    MB_OK);
                break;
            }
        }

        break;
    }

    case WM_DESTROY: {
        PostQuitMessage(0);
        break;
    }

    default:
        return DefWindowProc(hwnd, Message, wParam, lParam);
    }
    return 0;
}

int WINAPI WinMain(HINSTANCE hInstance,
    HINSTANCE hPrevInstance,
    LPSTR lpCmdLine,
    int nCmdShow)
{
    WNDCLASSEX wc;
    HWND hwnd;
    MSG Msg;

    memset(&wc, 0, sizeof(wc));
    wc.cbSize = sizeof(WNDCLASSEX);
    wc.lpfnWndProc = WndProc;
    wc.hInstance = hInstance;
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);

    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wc.lpszClassName = "WindowClass";
    wc.hIcon = LoadIcon(NULL, IDI_APPLICATION);
    wc.hIconSm = LoadIcon(NULL, IDI_APPLICATION);

    if (!RegisterClassEx(&wc)) {
        MessageBox(NULL, "Window Registration Failed!", "Error!",
            MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }

    hwnd = CreateWindowEx(WS_EX_CLIENTEDGE, "WindowClass", "Калькулятор",
        WS_VISIBLE | WS_OVERLAPPEDWINDOW & ~(WS_MAXIMIZEBOX | WS_MINIMIZEBOX | WS_THICKFRAME),
        CW_USEDEFAULT, /* x */
        CW_USEDEFAULT, /* y */
        MW_WIDTH, /* width */
        MW_HEIGHT, /* height */
        NULL, NULL, hInstance, NULL);

    Edit = CreateWindowEx(WS_EX_CLIENTEDGE, "Edit", "",
        WS_VISIBLE | WS_CHILD | ES_MULTILINE | ES_NUMBER,
        B_POS_X_0, /* x */
        B_POS_Y_E, /* y */
        EDIT_WIDTH, /* width */
        EDIT_HEIGHT, /* height */
        hwnd, NULL, hInstance, NULL);

    createButtons(hwnd, hInstance, buttonDescriptions, buttons, sizeof(buttonDescriptions) / sizeof(*buttonDescriptions));

    if (hwnd == NULL) {
        MessageBox(NULL, "Window Creation Failed!", "Error!",
            MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }

    while (GetMessage(&Msg, NULL, 0, 0) > 0) { /* If no error is received... */
        TranslateMessage(&Msg); /* Translate key codes to chars if present */
        DispatchMessage(&Msg); /* Send it to WndProc */
    }

    return Msg.wParam;
}
