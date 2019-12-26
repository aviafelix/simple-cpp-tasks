#include <iostream>
#include <vector>
using namespace std;

int main()
{
    int n = 10;
    int number;

    vector<int> a;
    vector<int> b;
    vector<int> c;

    cout << "Введите массив 'a' (" << n << " компонент):" << endl;
    for (int i = 0; i < n; ++i) {
        cin >> number;
        a.push_back(number);
    }

    cout << "Введите массив 'b' (" << n << " компонент):" << endl;
    for (int i = 0; i < n; ++i) {
        cin >> number;
        b.push_back(number);
    }

    cout << endl;
    cout << "a = {";

    for (int i = 0; i != a.size(); ++i) {
        if (i != 0)
            cout << ", ";
        cout << a[i];
    }
    cout << "}" << endl;

    cout << "b = {";
    for (int i = 0; i != b.size(); ++i) {
        if (i != 0)
            cout << ", ";
        cout << b[i];
    }
    cout << "}" << endl;

    for (int i = 0; i < a.size(); ++i) {
        if (i % 2 == 0) {
            // чётная позиция элемента;
            c.push_back(a[i]);
        } else {
            // нечтная позиция элемента
            c.push_back(b[i]);
        }
    }

    cout << endl;
    cout << "c = {";
    for (int i = 0; i != c.size(); ++i) {
        if (i != 0)
            cout << ", ";
        cout << c[i];
    }
    cout << "}" << endl;

}
