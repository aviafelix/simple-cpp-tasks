#pragma comment(lib, "user32.lib")

#include <windows.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

HWND Edit;
static HWND button_1;
static HWND button_2;
static HWND button_3;
static HWND button_4;
static HWND button_5;
static HWND button_6;
static HWND button_7;
static HWND button_8;
static HWND button_9;
static HWND button_Zero;

static HWND button_Point;
static HWND button_NEG;

static HWND button_Plus;
static HWND button_Minus;
static HWND button_Multiply;
static HWND button_Divide;
static HWND button_Equal;

static HWND button_BKSP;
static HWND button_CLEAR;
static HWND button_CLEAR_EDIT;

static HWND button_MEMO_SAVE;
static HWND button_MEMO_RESTORE;
static HWND button_MEMO_CLEAR;

static HWND button_About;

const char* buttonNumbers[10] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};

char *FirstOperand = new char[32];
char *SecondOperand = new char[32];
char *MemoOperand = new char[32];

int Sign;

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
                Sign = Plus;
                for (int i = 0; i <= strlen(FirstOperand); i++)
                    SecondOperand[i] = FirstOperand[i];
                FirstOperand[0] = 0;
                SetWindowText(Edit, "");
                break;
            }

            case Minus: {
                Sign = Minus;
                for (int i = 0; i <= strlen(FirstOperand); i++)
                    SecondOperand[i] = FirstOperand[i];
                FirstOperand[0] = 0;
                SetWindowText(Edit, "");
                break;
            }

            case Multiply: {
                Sign = Multiply;
                for (int i = 0; i <= strlen(FirstOperand); i++)
                    SecondOperand[i] = FirstOperand[i];
                FirstOperand[0] = 0;
                SetWindowText(Edit, "");
                break;
            }

            case Divide: {
                Sign = Divide;
                for (int i = 0; i <= strlen(FirstOperand); i++)
                    SecondOperand[i] = FirstOperand[i];
                FirstOperand[0] = 0;
                SetWindowText(Edit, "");
                break;
            }

            case Equal: {
                double _FirstOperand = atof(FirstOperand);
                double _SecondOperand = atof(SecondOperand);
                if (_FirstOperand == 0 && Sign == Divide) {
                    MessageBox(NULL, "Деление на ноль", "ERROR", MB_ICONERROR);
                    FirstOperand[0] = 0;
                    SecondOperand[0] = 0;
                    break;
                }
                FirstOperand[0] = 0;
                SecondOperand[0] = 0;

                if (Sign == Plus) {
                    double FirstOperandDouble = _SecondOperand + _FirstOperand;
                    sprintf(FirstOperand, "%lf", FirstOperandDouble);
                }

                if (Sign == Minus) {
                    double FirstOperandDouble = _SecondOperand - _FirstOperand;
                    sprintf(FirstOperand, "%lf", FirstOperandDouble);
                }

                if (Sign == Multiply) {
                    double FirstOperandDouble = _SecondOperand * _FirstOperand;
                    sprintf(FirstOperand, "%lf", FirstOperandDouble);
                }

                if (Sign == Divide) {
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
        delete[] FirstOperand;
        delete[] SecondOperand;
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

    button_1 = CreateWindow("button", "1", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_0, B_POS_Y_4, B_WIDTH, B_HEIGHT, hwnd, HMENU(1), hInstance, NULL);
    button_2 = CreateWindow("button", "2", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_1, B_POS_Y_4, B_WIDTH, B_HEIGHT, hwnd, HMENU(2), hInstance, NULL);
    button_3 = CreateWindow("button", "3", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_2, B_POS_Y_4, B_WIDTH, B_HEIGHT, hwnd, HMENU(3), hInstance, NULL);
    button_4 = CreateWindow("button", "4", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_0, B_POS_Y_3, B_WIDTH, B_HEIGHT, hwnd, HMENU(4), hInstance, NULL);
    button_5 = CreateWindow("button", "5", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_1, B_POS_Y_3, B_WIDTH, B_HEIGHT, hwnd, HMENU(5), hInstance, NULL);
    button_6 = CreateWindow("button", "6", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_2, B_POS_Y_3, B_WIDTH, B_HEIGHT, hwnd, HMENU(6), hInstance, NULL);
    button_7 = CreateWindow("button", "7", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_0, B_POS_Y_2, B_WIDTH, B_HEIGHT, hwnd, HMENU(7), hInstance, NULL);
    button_8 = CreateWindow("button", "8", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_1, B_POS_Y_2, B_WIDTH, B_HEIGHT, hwnd, HMENU(8), hInstance, NULL);
    button_9 = CreateWindow("button", "9", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_2, B_POS_Y_2, B_WIDTH, B_HEIGHT, hwnd, HMENU(9), hInstance, NULL);
    button_Zero = CreateWindow("button", "0", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_1, B_POS_Y_5, B_WIDTH, B_HEIGHT, hwnd, HMENU(Zero), hInstance, NULL);

    button_Plus = CreateWindow("button", "+", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_3, B_POS_Y_4, B_WIDTH, B_HEIGHT, hwnd, HMENU(Plus), hInstance, NULL);
    button_Minus = CreateWindow("button", "-", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_3, B_POS_Y_3, B_WIDTH, B_HEIGHT, hwnd, HMENU(Minus), hInstance, NULL);
    button_Multiply = CreateWindow("button", "*", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_3, B_POS_Y_2, B_WIDTH, B_HEIGHT, hwnd, HMENU(Multiply), hInstance, NULL);
    button_Divide = CreateWindow("button", "/", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_3, B_POS_Y_1, B_WIDTH, B_HEIGHT, hwnd, HMENU(Divide), hInstance, NULL);
    button_Equal = CreateWindow("button", "=", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_3, B_POS_Y_5, B_WIDTH, B_HEIGHT, hwnd, HMENU(Equal), hInstance, NULL);

    button_Point = CreateWindow("button", ".", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_2, B_POS_Y_5, B_WIDTH, B_HEIGHT, hwnd, HMENU(Point), hInstance, NULL);

    button_BKSP = CreateWindow("button", "<-", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_0, B_POS_Y_1, B_WIDTH, B_HEIGHT, hwnd, HMENU(BackSpace), hInstance, NULL);
    button_CLEAR_EDIT = CreateWindow("button", "CE", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_1, B_POS_Y_1, B_WIDTH, B_HEIGHT, hwnd, HMENU(ClearLast), hInstance, NULL);
    button_CLEAR = CreateWindow("button", "C", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_2, B_POS_Y_1, B_WIDTH, B_HEIGHT, hwnd, HMENU(ClearAll), hInstance, NULL);

    button_MEMO_CLEAR = CreateWindow("button", "MC", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_0, B_POS_Y_0, B_WIDTH, B_HEIGHT, hwnd, HMENU(MemoClear), hInstance, NULL);
    button_MEMO_RESTORE = CreateWindow("button", "MR", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_1, B_POS_Y_0, B_WIDTH, B_HEIGHT, hwnd, HMENU(MemoRestore), hInstance, NULL);
    button_MEMO_SAVE = CreateWindow("button", "MS", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_2, B_POS_Y_0, B_WIDTH, B_HEIGHT, hwnd, HMENU(MemoSave), hInstance, NULL);

    button_NEG = CreateWindow("button", "-/+", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
        B_POS_X_0, B_POS_Y_5, B_WIDTH, B_HEIGHT, hwnd, HMENU(Negative), hInstance, NULL);

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
