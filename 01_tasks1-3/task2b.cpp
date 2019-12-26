#include <iostream>
#include <cmath>
#include <conio.h>
using namespace std;

int main()
{
    double a, b, c, d, x, nu, D;

    cout << "a = ";
    cin >> a;

    cout << "b = ";
    cin >> b;

    cout << "c = ";
    cin >> c;

    cout << "d = ";
    cin >> d;

    D = b * b - 4 * a * c;

    if ( D < 0 ) {
        cout << "D < 0, нет решений в действительных числах" << endl;
        return -1;
    }

    x = min(
        0.5 * (-b + sqrt(D)) / a,
        0.5 * (-b - sqrt(D)) / a
    );

    nu =  sin(d * exp(0.2 * log(x * x + 4)) ) * exp(2 * x);

    cout << endl;
    cout << "a = " << a << endl;
    cout << "b = " << b << endl;
    cout << "c = " << c << endl;
    cout << "d = " << c << endl;
    cout << "x = " << x << endl;
    cout << "nu = " << nu << endl;

    // _getch();

}
