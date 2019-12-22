#include <iostream>
#include <sstream>
#include <fstream>
#include <cmath>
#include <ctime>
#include <cstdlib>
using namespace std;

// Структура, хранящая информацию об окружности
typedef struct Circle
{
    double x, y, r;
} TCircle;

// Тип, определяющий указатель на структуру.
// То есть, это просто адрес, по которому начинаются данные структуры.
typedef TCircle* PTCircle;

// Генерирует случайное число типа double в диапазоне от fMin до fMax
double fRand(double fMin, double fMax)
{
    double f = (double)rand() / RAND_MAX;
    return fMin + f * (fMax - fMin);
}

// Функция, которая генерирует массив случайных окружностей заданной длины length
TCircle* generateRandomCircles(size_t length, double minX, double maxX, double minY, double maxY, double minR, double maxR) {
    TCircle* arr = new TCircle[length];

    for (size_t i = 0; i < length; ++i) {
        arr[i].x = fRand(minX, maxX);
        arr[i].y = fRand(minY, maxY);
        arr[i].r = fRand(minR, maxR);
    }

    return arr;
}

// Функция, выводящая информацию о хранящихся в исходном массиве окружностях
void listCircles(TCircle* arr, size_t length) {
    for (size_t i = 0; i < length; ++i) {
        cout << "X=" << arr[i].x << "; Y=" << arr[i].y << "; R=" << arr[i].r << endl;
    }
}

// Функция, выводящая информацию об окружностях на основе массива,
// хранящего ссылки на исходный массив
void listCircles(PTCircle* parr, size_t length) {
    for (size_t i = 0; i < length; ++i) {
        cout << "X=" << parr[i] -> x << "; Y=" << parr[i] -> y << "; R=" << parr[i] -> r << endl;
    }
}

void sortCircles(PTCircle* parr, size_t length, double TCircle:: *field, bool desc) {
    PTCircle tmp;
    if (desc) {
        for (size_t i = 0; i < length - 1; i++) {
            for (size_t j = i + 1; j < length; j++) {
                if (parr[i]->*field < parr[j]->*field) {
                    tmp = parr[j];
                    parr[j] = parr[i];
                    parr[i] = tmp;
                }
            }
        }
    } else {
        for (size_t i = 0; i < length - 1; i++) {
            for (size_t j = i + 1; j < length; j++) {
                if (parr[i]->*field > parr[j]->*field) {
                    tmp = parr[j];
                    parr[j] = parr[i];
                    parr[i] = tmp;
                }
            }
        }
    }
}

// Основная программаа
int main(int argc, char const *argv[])
{
    // Указатель на массив структур
    TCircle* arr;
    // Указатель на массив, хранящий указатели на структуры исходного массива
    PTCircle* parr;
    // Длина текущего массива
    size_t length;

    // Инициация генератора псевдослучайных чисел
    std::srand(std::time(NULL));

    // -------------------------------------------------------------
    // Этот участок кода не имеет отношения к конечной программе,
    // служит демонстрационной цели
    TCircle c1, c2;

    c1.x = 10;
    c1.y = 20;
    c1.r = 30;

    // Скопировать данные первой окружности во вторую
    c2 = c1;

    cout << "-------------------------------------" << endl;
    cout << "Первая окружность: ";
    cout << "x=" << c1.x << " : y=" << c1.y << " : r="  << c1.r << endl;
    cout << "Вторая окружность: ";
    cout << "x=" << c2.x << " : y=" << c2.y << " : r="  << c2.r << endl;
    cout << "-------------------------------------" << endl;
    // === Конец демонстрационного кода ===
    // -------------------------------------------------------------


    // Жёстко задаём длину массива, можно попросить пользователя ввести размер массива
    length = 10;

    // Сгенерировать массив окружностей длины length 
    arr = generateRandomCircles(length, -50, 50, -50, 50, 0, 100);

    // Создать массив указателей на структуры и заполнить его в порядке,
    // по которому расположены структуры в исходном массиве
    parr = new PTCircle[length];
    for (size_t i = 0; i < length; ++i) {
        // в ячейку массива записываем адрес структуры главного массива со структурами
        parr[i] = &arr[i];
    }

    // Вывести исходный массив
    cout << endl << "Окружности в исходном массиве:" << endl;
    listCircles(arr, length);
    // Вывести массив по указателям, хранящимся во втором массиве
    // Используется перегруженная функция для параметров других типов
    // Перегрузка функций в объектно-ориентированном программировании
    // это когда функция с одним и тем же именем может обрабатывать
    // данные разных типов или разное число аргументов
    cout << endl << "Окружности по массиву указателей:" << endl;
    listCircles(parr, length);

    cout << endl << "sort by X asc:" << endl;
    sortCircles(parr, length, &TCircle::x, false);
    listCircles(parr, length);

    cout << endl << "sort by Y desc:" << endl;
    sortCircles(parr, length, &TCircle::y, true);
    listCircles(parr, length);

    cout << endl << "sort by R asc:" << endl;
    sortCircles(parr, length, &TCircle::r, false);
    listCircles(parr, length);

    return 0;
}
