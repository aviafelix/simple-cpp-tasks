#pragma comment(lib, "user32.lib")
#pragma comment(lib, "kernel32.lib")
#pragma comment(lib, "comdlg32.lib")
#pragma comment(lib, "shell32.lib")
#pragma comment(lib, "gdi32.lib")
#pragma comment(lib, "comctl32.lib")
#pragma comment(lib, "rex.lib")

// #ifndef UNICODE
// #define UNICODE
// #endif

#include <windows.h>
#include <commctrl.h>
#include <stdlib.h>
#include <stdio.h>
#include <shellapi.h>
#include <string.h>
#include "rex.h"

const static char HLP[] = "ShymplerHelp.HTM";
const static char well_msg[] = "Программа стартовала!\r\nСлушайте =  > ";

// const static char musname[260] = "Вечерний звон.mid";
// const static char musname[260] =  { }
const static char musname[260] = "_0.mid";

const static char xyz_title[] = " => Инфо о меню EAX : [|}";

const static struct xyz {
    unsigned char _msg[24];
    unsigned char _eax_reg_0;
    unsigned char _eax_reg_1;
    unsigned char _eax_reg_2;
    unsigned char _eax_reg_3;
    unsigned char _eax_reg_4;
    unsigned char _eax_reg_5;
    unsigned char _eax_reg_6;
    unsigned char _eax_reg_7;
    unsigned char null;
} xyz = {
    {'З', 'н', 'а', 'ч', 'е', 'н', 'и', 'е', ' ', 'р', 'е', 'г', 'и', 'с', 'т', 'р', 'а', ' ', 'E', 'A', 'X', ' ', '=', ' '},
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0
};

const static char message_[] = "Произошла ошибка инициализации REX!",
                  mainmenuname[] = "IDM_MAINMENU",
                  maindialname[] = "IDD_MAIN",
                  addfiledialname[] = "IDD_ADDFILES",
                  adddirdialname[] = "IDD_ADDDIRS",
                  dplaylistname[] = "IDD_PLAYLIST",
                  dloadingname[] = "IDD_LOADING",
                  daboutname[] = "IDD_ABOUT",
                  wclass_name[] = "Shymplayer",
                  wnd_name[] = "Shyar MIDI Player";

// wndc WNDCLASSEX <4*12 , CS_HREDRAW or CS_VREDRAW,offset maindialogproc,0,0,?,?,?,\
//            COLOR_WINDOW+1,offset mainmenuname,offset wclass_name,0>

static DWORD icon_n = 0;   // заменить на 0
static BYTE showplaylist = 0,
                  playlistshowed = 0,
                  minmz = 1,
                  direction = 0, // 0-вперёд; 1 — цикл
                  cmdp_empty = 1;

static INITCOMMONCONTROLSEX InitCtrlEx = { sizeof(INITCOMMONCONTROLSEX), ICC_STANDARD_CLASSES };

static HINSTANCE hInst;
static DWORD hplaylistwnd,
      haddfilewnd,
      hadddirwnd,
      hloading,
      hmenu,
      hdialwnd;

static HICON hIcn[9] = { };
static RECT rectangle = { };

INT_PTR
CALLBACK
loadingProc(HWND hldWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
        case WM_INITDIALOG:
            break;

        case WM_CLOSE:
            DestroyWindow(hldWnd);
            break;

        // default:
        //     return ::DefWindowProc(hMainWnd, uMsg, wParam, lParam);
    }

    return 0;
}

INT_PTR
CALLBACK
mainDialProc(HWND hdpWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
        case WM_INITDIALOG:
            SendMessage(hdpWnd, WM_SETICON, NULL, (LPARAM)hIcn[0]);
            break;

        case WM_CLOSE:
            EndDialog(hdpWnd, NULL);
            break;

        // default:
        //     return ::DefWindowProc(hMainWnd, uMsg, wParam, lParam);
    }

    return 0;
}


int
WINAPI
// wWinMain(
WinMain(
    HINSTANCE hInstance,
    HINSTANCE hPrevInstance,
    // PWSTR pCmdLine,
    LPSTR lpCmdLine,
    int nCmdShow)
{
    LPWSTR pCmdLine;
    int nArgs;
    LPWSTR* pCmdLineArgs;

    IsDebuggerPresent();
    InitCommonControlsEx(&InitCtrlEx);

    pCmdLine = GetCommandLineW();
    pCmdLineArgs = CommandLineToArgvW(pCmdLine, &nArgs);
    if (nArgs > 1) {
        MessageBox(NULL, "cmd line is NOT empty", "[info]", MB_ICONINFORMATION);
    } else {
        // command line is empty
        MessageBox(NULL, "cmd line is empty", "[info]", MB_ICONINFORMATION);
    }

    LocalFree(pCmdLineArgs);

    MessageBox(NULL, musname, xyz_title, MB_ICONINFORMATION);
    // MessageBox(NULL /*hInst*/, (LPCSTR)xyz._msg, xyz_title, MB_ICONEXCLAMATION | MB_OK);

    hInst = GetModuleHandle(0);
    for (size_t i = 0; i < 9; ++i) {
        hIcn[i] = LoadIcon(hInst, MAKEINTRESOURCE(i));
    }

    Rex_MIDI_init();
    HWND hLoadingWnd = CreateDialogParam(hInst, dloadingname, NULL, loadingProc, NULL);
    Rex_MIDI_load(musname);
    DestroyWindow(hLoadingWnd);

    INT_PTR hMainDialPtr = DialogBoxParam(hInst, maindialname, NULL, mainDialProc, NULL);

    Rex_MIDI_stop();
    Rex_MIDI_unload();
    Rex_MIDI_exit();
}
