#pragma comment(lib, "user32.lib")
#pragma comment(lib, "kernel32.lib")
#pragma comment(lib, "comdlg32.lib")
#pragma comment(lib, "rex.lib")
#pragma comment(lib, "shell32.lib")
#pragma comment(lib, "gdi32.lib")
#pragma comment(lib, "comctl32.lib")

// #ifndef UNICODE
// #define UNICODE
// #endif

#include <windows.h>
#include <commctrl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

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

static DWORD hplaylistwnd,
      haddfilewnd,
      hadddirwnd,
      hloading,
      hinst,
      hmenu,
      hdialwnd;

static DWORD hicn[9] = { };
static RECT rectangle = { };

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
    MessageBox(NULL, musname, xyz_title, MB_ICONINFORMATION);
    // MessageBox(NULL /*hinst*/, (LPCSTR)xyz._msg, xyz_title, MB_ICONEXCLAMATION | MB_OK);
    IsDebuggerPresent();
    InitCommonControlsEx(&InitCtrlEx);
}
