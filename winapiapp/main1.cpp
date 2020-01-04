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

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PWSTR pCmdLine, int nCmdShow)
{
    const wchar_t CLASS_NAME[]  = L"Currculator Window Class";

    WNDCLASSEX wc = { };

    wc.cbSize = sizeof(WNDCLASSEX);
    wc.lpfnWndProc   = WindowProc;
    wc.hInstance     = hInstance;
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);

    // wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wc.hbrBackground = GetStockObject(WHITE_BRUSH);
    wc.lpszClassName = CLASS_NAME;
    wc.hIcon = LoadIcon(NULL, IDI_APPLICATION);
    wc.hIconSm = LoadIcon(NULL, IDI_APPLICATION);

    if (!RegisterClassEx(&wc)) {
        MessageBox(NULL, "Window registration is failed!", "Error!", MB_ICONEXCLAMATION | MB_OK);
    }

    return 0;
}
