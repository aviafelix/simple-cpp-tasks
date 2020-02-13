comment ~
WNDCLASSEX      struc
    cbSize      dd  ?
    style       dd  ?
    lpfnWndProc dd  ?
    cbClsExtra  dd  ?
    cbWndExtra  dd  ?
    hInstance   dd  ?
    hIcon       dd  ?
    hCursor     dd  ?
    hbrBackground   dd  ?
    lpszMenuName    dd  ?
    lpszClassName   dd  ?
    hIconSm     dd  ?
WNDCLASSEX  ends
MSG         struc
    hwnd        dd  ?
    message     dd  ?
    wParam      dd  ?
    lParam      dd  ?
    time        dd  ?
    pt      dd  ?
MSG     ends

    LPVOID      lpCreateParams;
    HINSTANCE   hInstance;
    HMENU       hMenu;
    HWND        hwndParent;
    int         cy;
    int         cx;
    int         y;
    int         x;
    LONG        style;
    LPCSTR      lpszName;
    LPCSTR      lpszClass;
    DWORD       dwExStyle;
~
