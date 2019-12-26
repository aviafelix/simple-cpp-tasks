#include <iostream>
#include <cmath>
#include <conio.h>
using namespace std;

int main()
{
    double a, b, c, d, x;
    bool x_in_ab, x_in_cd;

    cout << "a = ";
    cin >> a;
    cout << "b = ";
    cin >> b;
    cout << "x = ";
    cin >> x;
    cout << "c = ";
    cin >> c;
    cout << "d = ";
    cin >> d;

    x_in_ab = (min(a, b) <= x) && (x <= max(a, b));
    x_in_cd = (min(c, d) <= x) && (x <= max(c, d));


    // Variant 1
    if (x_in_ab) {
        cout << "x prinadlezhit ab" << endl;
    } else {
        cout << "x ne prinadlezhit ab" << endl;
    }

    if (x_in_cd) {
        cout << "x prinadlezhit cd" << endl;
    } else {
        cout << "x ne prinadlezhit cd" << endl;
    }


    // Variant 2
    if (x_in_ab && x_in_cd) {
        cout << "x prinadlezhit ab i cd" << endl;
    } else if (x_in_ab && !x_in_cd) {
        cout << "x prinadlezhit ab i ne prinadlezhit cd" << endl;
    } else if (!x_in_ab && x_in_cd) {
        cout << "x ne prinadlezhit ab i prinadlezhit cd" << endl;
    } else {
        cout << "x ne prinadlezhit ni ab, ni cd" << endl;
    }

    getch();
    # _getch();
}
