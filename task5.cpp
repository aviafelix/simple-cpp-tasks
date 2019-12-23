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
typedef TCircle *PTCircle;

// Генерирует случайное число типа double в диапазоне от fMin до fMax
double fRand(double fMin, double fMax)
{
    double f = (double)rand() / RAND_MAX;
    return fMin + f * (fMax - fMin);
}

// Функция, которая генерирует массив случайных окружностей заданной длины length
TCircle *generateRandomCircles(double minX, double maxX, double minY, double maxY, double minR, double maxR, size_t length) {
    TCircle *circlesArr = new TCircle[length];

    for (size_t i = 0; i < length; ++i) {
        circlesArr[i].x = fRand(minX, maxX);
        circlesArr[i].y = fRand(minY, maxY);
        circlesArr[i].r = fRand(minR, maxR);
    }

    return circlesArr;
}

PTCircle *createPointersArray(TCircle *circlesArr, size_t length) {
    PTCircle *pCirclesArr;

    // Создать массив указателей на структуры и заполнить его в порядке,
    // по которому расположены структуры в исходном массиве
    pCirclesArr = new PTCircle[length];

    for (size_t i = 0; i < length; ++i) {
        // в ячейку массива записываем адрес структуры главного массива со структурами
        pCirclesArr[i] = &circlesArr[i];
    }

    return pCirclesArr;
}

// Функция, выводящая информацию о хранящихся в исходном массиве окружностях
void listCircles(TCircle *circlesArr, size_t length) {
    for (size_t i = 0; i < length; ++i) {
        cout << "X=" << circlesArr[i].x << "; Y=" << circlesArr[i].y << "; R=" << circlesArr[i].r << endl;
    }
}

// Функция, выводящая информацию об окружностях на основе массива,
// хранящего ссылки на исходный массив
void listCircles(PTCircle *pCirclesArr, size_t length) {
    for (size_t i = 0; i < length; ++i) {
        cout << "X=" << pCirclesArr[i] -> x << "; Y=" << pCirclesArr[i] -> y << "; R=" << pCirclesArr[i] -> r << endl;
    }
}

void sortCircles(PTCircle *pCirclesArr, size_t length, double TCircle:: *field, bool desc) {
    PTCircle tmp;
    if (desc) {
        for (size_t i = 0; i < length - 1; i++) {
            for (size_t j = i + 1; j < length; j++) {
                if (pCirclesArr[i]->*field < pCirclesArr[j]->*field) {
                    tmp = pCirclesArr[j];
                    pCirclesArr[j] = pCirclesArr[i];
                    pCirclesArr[i] = tmp;
                }
            }
        }
    } else {
        for (size_t i = 0; i < length - 1; i++) {
            for (size_t j = i + 1; j < length; j++) {
                if (pCirclesArr[i]->*field > pCirclesArr[j]->*field) {
                    tmp = pCirclesArr[j];
                    pCirclesArr[j] = pCirclesArr[i];
                    pCirclesArr[i] = tmp;
                }
            }
        }
    }
}

void inputCircle(TCircle& circle) {
    cout << "Введите координату X:" << endl;
    cin >> circle.x;
    cout << "Введите координату Y:" << endl;
    cin >> circle.y;
    cout << "Введите радиус R:" << endl;
    cin >> circle.r;
}

TCircle *inputCirclesArray(size_t length) {
    TCircle *circlesArr = new TCircle[length];

    for (size_t i = 0; i < length; ++i) {
        cout << "Введите окружность > " << i + 1 << endl;
        inputCircle(circlesArr[i]);
    }

    return circlesArr;
}

void userSortCircles(PTCircle *pCirclesArr, size_t length) {

    char userInput;
    bool sortOrder = false;

    do {
        cout << "Введите команду:" << endl;
        cout << "'x', 'X' - сортировать по X" << endl;
        cout << "'y', 'Y' - сортировать по Y" << endl;
        cout << "'r', 'R' - сортировать по R" << endl;
        cout << "'a(scending)', для выбора сортировки по неубыванию" << endl;
        cout << "'d(escending)', для выбора сортировки по невозрастанию" << endl;
        cout << "'s(witch)', сменить текущий порядок сортировки" << endl;
        cout << "'q' - выход" << endl;
        cout << endl
             << "Текущий порядок сортировки: "
             << (sortOrder ? "по невозрастанию" : "по неубыванию") << endl;

        cin >> userInput;

        switch (userInput) {
            case 'X':
                userInput = 'x';
            case 'x':
                sortCircles(pCirclesArr, length, &TCircle::x, sortOrder);
                cout << "Массив отсортирован по X" << endl;
                break;
            case 'Y':
                sortCircles(pCirclesArr, length, &TCircle::y, sortOrder);
                cout << "Массив отсортирован по Y" << endl;
                userInput = 'y';
            case 'y':
                break;
            case 'R':
                userInput = 'r';
            case 'r':
                sortCircles(pCirclesArr, length, &TCircle::r, sortOrder);
                cout << "Массив отсортирован по R" << endl;
            case 'a':
                sortOrder = false;
                break;
            case 'd':
                sortOrder = true;
                break;
            case 's':
                sortOrder = !sortOrder;
                break;
            case 'q':
                return;
            default:
                cout << "Неправильный символ, повторите ввод" << endl;
                break;
        }

    } while (userInput != 'x' && userInput != 'y' && userInput != 'r');
}

void mainCycle() {
    // Указатель на массив структур, описывающих окружности
    TCircle *circlesArr, *oldCirclesArr;
    // Указатель на массив, хранящий указатели на структуры исходного массива
    PTCircle *pCirclesArr, *oldPCirclesArr;
    // Длина текущего массива
    size_t length;

    double minX, maxX, minY, maxY, maxR;
    double minR = 0;

    char userInput;

    do {
        cout << "Введите команду:" << endl;
        cout << "'1', сгенерировать массив окружностей" << endl;
        cout << "'2', ввести окружности вручную" << endl;
        cout << "'x', 'q' - выход" << endl;

        cin >> userInput;

        switch (userInput) {
            case '1':
                cout << "Введите количество окружностей" << endl;
                cin >> length;
                cout << "Введите параметры окружностей" << endl;
                cout << "minX:" << endl;
                cin >> minX;
                cout << "maxX:" << endl;
                cin >> maxX;
                cout << "minY:" << endl;
                cin >> minY;
                cout << "maxY:" << endl;
                cin >> maxY;
                cout << "maxR:" << endl;
                cin >> maxR;
                circlesArr = generateRandomCircles(minX, maxX, minY, maxY, minR, maxR, length);
                break;
            case '2':
                cout << "Введите количество окружностей" << endl;
                cin >> length;
                circlesArr = inputCirclesArray(length);
                break;
            case 'x':
            case 'q':
                return;
            default:
                cout << "Неправильный символ, повторите ввод" << endl;
                break;
        }

    } while (userInput != '1' && userInput != '2');

    pCirclesArr = createPointersArray(circlesArr, length);

    do {
        cout << "Нажмите клавишу для выполнения команды" << endl;
        cout << "'s(ort)' - сортировка массива окружностей" << endl;
        cout << "'a(dd)' - добавить окружность" << endl;
        cout << "'c(lear)' - очистить массив окружностей" << endl;
        cout << "'v(iew)' - показать массив окружностей" << endl;
        cout << "'x', 'q' - выход" << endl;

        cin >> userInput;

        switch (userInput) {
            case 's':
                userSortCircles(pCirclesArr, length);
                break;
            case 'v':
                listCircles(pCirclesArr, length);
                break;
            case 'a':
                cout << "Добавить окружность:" << endl;

                // Сохранить старые указатели
                oldCirclesArr = circlesArr;
                oldPCirclesArr = pCirclesArr;
                // Создать новые с количеством элементов на 1 больше
                circlesArr = new TCircle[length + 1];
                pCirclesArr = new PTCircle[length + 1];
                // Копировать старые данные в новые массивы
                for (size_t i = 0; i < length; ++i) {
                    // В новом массиве окажутся окружности в порядке согласно последней
                    // сортировке
                    circlesArr[i] = *oldPCirclesArr[i];
                    pCirclesArr[i] = &circlesArr[i];
                }

                delete[] oldCirclesArr;
                delete[] oldPCirclesArr;

                inputCircle(circlesArr[length]);
                pCirclesArr[length] = &circlesArr[length];

                length += 1;

                break;
            case 'c':
                length = 0;
                cout << "Массив очищен" << endl;
                break;
            case 'x':
            case 'q':
                return;
            default:
                cout << "Неправильный символ, повторите ввод" << endl;
                break;
        }

    } while (userInput != 'q' && userInput != 'x');

    delete[] pCirclesArr;
    delete[] circlesArr;
}

int example() {
    // Указатель на массив структур
    TCircle *arr;
    // Указатель на массив, хранящий указатели на структуры исходного массива
    PTCircle *parr;
    // Длина текущего массива
    size_t length;

    setlocale(LC_ALL,"ru");
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
    arr = generateRandomCircles(-50, 50, -50, 50, 0, 100, length);

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

// Основная программаа
int main(int argc, char const *argv[])
{
    // return example();

    mainCycle();

    return 0;
}
