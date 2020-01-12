#pragma comment(lib, "user32.lib")
#pragma comment(lib, "gdi32.lib")

/*
    Написать калькулятор с WinAPI (без использования форм).
    Должны быть кнопки обычного калькулятора (цифры, точка,
    четыре операции, память, равно, поле для отображения)
*/

// https://habr.com/ru/post/352096/
// https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getmessagea
// https://github.com/MicrosoftDocs/cpp-docs/blob/master/docs/build/reference/compiler-options-listed-alphabetically.md
// https://docs.microsoft.com/en-us/windows/win32/learnwin32/your-first-windows-program
// https://docs.microsoft.com/en-us/windows/win32/menurc/using-cursors
// https://rsdn.org/article/baseserv/api32.xml
// http://cppstudio.com/post/9384/
// https://caiorss.github.io/C-Cpp-Notes/WindowsAPI-cpp.html
// https://www.codementor.io/@malortie/c-cpp-tutorial-build-win32-api-app-part-1-du107u9je

#ifndef UNICODE
#define UNICODE
#endif

#include <windows.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

LRESULT
CALLBACK
mainWndProc(HWND hMainWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
        case WM_CREATE:
            break;

        case WM_COMMAND:
            break;

        case WM_DESTROY:
            PostQuitMessage(0);
            break;

        default:
            return ::DefWindowProc(hMainWnd, uMsg, wParam, lParam);
    }

    return 0;
}

int
WINAPI
wWinMain(
    HINSTANCE hInstance,
    HINSTANCE hPrevInstance,
    PWSTR pCmdLine,
    int nCmdShow)
{
    const wchar_t CLASS_NAME[]  = L"Currculator Window Class";

    WNDCLASSEX wcex = { };
    HWND hMainWnd;

    wcex.cbSize = sizeof(WNDCLASSEX);
    wcex.lpfnWndProc = mainWndProc;
    wcex.hInstance = hInstance;
    wcex.hCursor = LoadCursor(hInstance, IDC_ARROW);

    // wcex.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wcex.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH);
    wcex.lpszClassName = CLASS_NAME;
    wcex.hIcon = LoadIcon(hInstance, IDI_APPLICATION);
    wcex.hIconSm = LoadIcon(hInstance, IDI_APPLICATION);

    if ( !RegisterClassEx(&wcex) )
    {
        MessageBox(NULL, L"Window registration is failed!", L"Error!", MB_ICONEXCLAMATION | MB_OK);
        return -1;
    }

    CREATESTRUCT cs = { };
    cs.x = CW_USEDEFAULT;
    cs.y = CW_USEDEFAULT;
    cs.cx = 1280;
    cs.cy = 720;
    cs.hInstance = hInstance;
    cs.lpszClass = wcex.lpszClassName;
    cs.lpszName = L"Калькулятор";
    // cs.style = WS_OVERLAPPEDWINDOW;
    cs.style = WS_VISIBLE | WS_OVERLAPPEDWINDOW & ~(WS_MAXIMIZEBOX | WS_MINIMIZEBOX | WS_THICKFRAME);

    hMainWnd = CreateWindowEx(
        cs.dwExStyle,
        cs.lpszClass,
        cs.lpszName,
        cs.style,
        cs.x,
        cs.y,
        cs.cx,
        cs.cy,
        cs.hwndParent,
        cs.hMenu,
        cs.hInstance,
        cs.lpCreateParams
    );

    if (!hMainWnd)
    {
        MessageBoxW(NULL, L"Window creation is failed!", L"Error!", MB_ICONEXCLAMATION | MB_OK);
        return -1;
    }

    // HACCEL hAccel = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDR_ACCELERATOR));
    MSG msg = { };

    MessageBoxW(NULL, L"Йоу! — 1", L"No-error!", MB_ICONINFORMATION | MB_YESNO);

    ShowWindow(hMainWnd, SW_SHOWDEFAULT);
    UpdateWindow(hMainWnd);

    MessageBoxW(NULL, L"Йоу! — 2", L"No-error!", MB_ICONINFORMATION | MB_OK);

    BOOL bRet = 0;
    while ((bRet = GetMessage(&msg, hMainWnd, 0, 0)) > 0)
    {
        // if ( -1 == bRet )
        // {
        //     break;
        // }
        // if ( !TranslateAccelerator(hMainWnd, hAccel, &msg) )
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }

    UnregisterClass(wcex.lpszClassName, hInstance);

    return msg.wParam;
}
