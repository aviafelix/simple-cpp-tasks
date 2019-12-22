#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <cmath>
#include <ctime>
#include <cstdlib>
using namespace std;

template<class T>
class Array
{
    private:
        std::size_t _size;
        T* _arr;
    public:
        Array();
        Array(size_t N);
        Array(const Array<T>& old);

        ~Array();

        T& operator[](size_t index);

        size_t size();

        // void append(T& el);
        void append(T el);
        bool remove(size_t index);
        // T& pop();
        T pop();
        void clear();
        bool swap(size_t index1, size_t index2);

        void sort(bool desc);
        T mean();
        T meanSquare();
        T diffMeans();
        T maxDiff();

        void show();
};

template<class T>
Array<T>::Array()
{
    _size = 0;
    _arr = NULL;
}

template<class T>
Array<T>::Array(size_t N)
{
    _size = N;
    _arr = new T[N];
}

template<class T>
Array<T>::Array(const Array<T>& old)
{
    _size = old._size;
    _arr = old._arr;
}

template<class T>
Array<T>::~Array()
{
    if (_arr != NULL) {
        delete [] _arr;
    }
}

template<class T>
T& Array<T>::operator[](size_t index)
{
    if ((_arr != NULL) and (index < _size)) {
        return _arr[index];
    }
}

template<class T>
size_t Array<T>::size()
{
    return _size;
}

template<class T>
void Array<T>::append(T el)
{
    T *_tmp = new T[_size + 1];
    for (size_t i = 0; i < _size; ++i) {
        _tmp[i] = _arr[i];
    }

    if (_arr != NULL) {
        delete [] _arr;
    }
    _arr = _tmp;
    _arr[_size] = el;
    _size += 1;
}

template<class T>
bool Array<T>::remove(size_t index)
{
    if (index < 0 || index >= _size) {
        return false;
    }

    _size -= 1;
    for (size_t i = index; i < _size; ++i) {
        _arr[i] = _arr[i+1];
    }

    return true;
}

template<class T>
// T& Array<T>::pop()
T Array<T>::pop()
{
    if (_size > 0) {
        _size -= 1;
    }
    // return &_arr[_size];
    return _arr[_size];
}

template<class T>
void Array<T>::clear()
{
    _size = 0;
}

template<class T>
bool Array<T>::swap(size_t index1, size_t index2)
{
    T tmp;
    if (index1 >= _size || index1 < 0 || index2 >= _size || index2 < 0) {
        return false;
    } else {
        tmp = _arr[index2];
        _arr[index2] = _arr[index1];
        _arr[index1] = tmp;
        // swap(_arr[index1], _arr[index2]);

        return true;
    }
}

template<class T>
void Array<T>::sort(bool desc)
{
    T tmp;

    if (desc) {
        for (int i = 0; i < _size - 1; i++) {
            for (int j = i + 1; j < _size; j++) {
                if (_arr[i] < _arr[j]) {
                    // swap(_arr[j], _arr[i]);
                    tmp = _arr[j];
                    _arr[j] = _arr[i];
                    _arr[i] = tmp;
                }
            }
        }
    } else {
        for (int i = 0; i < _size - 1; i++) {
            for (int j = i + 1; j < _size; j++) {
                if (_arr[i] > _arr[j]) {
                    // swap(_arr[j], _arr[i]);
                    tmp = _arr[j];
                    _arr[j] = _arr[i];
                    _arr[i] = tmp;
                }
            }
        }
    }
}

template<class T>
T Array<T>::mean()
{
    T sum = 0;
    for (size_t i = 0; i < _size; ++i) {
        sum += _arr[i];
    }
    return sum / _size;

}

template<class T>
T Array<T>::meanSquare()
{
    double M = 0, S = 0;

    for (int i = 0; i < _size; i++)
    {
        M += _arr[i];
    }
    M /= _size;

    for (int i = 0; i < _size; i++)
    {   
        S += (_arr[i] - M) * (_arr[i] - M);
    }
    return sqrt(S / (_size - 1));
}

template<class T>
T Array<T>::diffMeans()
{
    return mean() - diffMeans();
}

template<class T>
T Array<T>::maxDiff()
{
    if (_size > 0) {    
        T max = _arr[0], min = _arr[0];
        for (size_t i = 1; i < _size; ++i) {
            if (max < _arr[i]) {
                max = _arr[i];
            }
            if (min > _arr[i]) {
                min = _arr[i];
            }
        }
        return max - min;
    } else {
        return -1;
    }
}

template<class T>
void Array<T>::show()
{
    cout << "array :: [";
    for (int i = 0; i < _size; ++i) {
        cout << (i == 0 ? "" : ", ") << _arr[i];
    }
    cout << "]" << endl;
}

/*
● Создать массив 
    ○ Выбрать файл с массивом (по желанию) 
    ○ Сгенерировать массив с задаваемым размером (по желанию) 
    ○ Ввести элементы вручную (обязательно) 
    ○ Назад 
● Показать массив 
    ○ Назад 
● Добавить элемент(-ы) 
● Удалить элемент(-ы) 
    ○ Удалить элемент(-ы) 
    ○ Очистить массив 
    ○ Назад 
● Поменять элементы местами 
● Сортировать 
    ○ Сортировать по неубыванию 
    ○ Сортировать по невозрастанию 
    ○ Назад 
● Среднее арифметическое 
● Максимальная разность 
● Среднеквадратическое отклонение 
● Разница средних 
● Выход
*/

template<class T>
// std::size_t size(Array<T> array)
std::size_t size(Array<T>& array)
{
    return array.size();
}

template<class T>
void showArray(Array<T>& arr) {
    arr.show();
}


const std::vector<int>& read_from_file(const std::string& input_file_name)
{
    static std::vector<int> arr;
    ifstream input_file(input_file_name.c_str());

    if (input_file.good()) {
        int current_number = 0;

        while (input_file >> current_number) {
            arr.push_back(current_number);
        }

        input_file.close();

    } else {
        cout << "error reading file";
    }

    return arr;
}

void show_array(const std::vector<int> arr) {
    cout << "[";
    for (int i = 0; i < arr.size(); ++i) {
        cout << arr[i] << ", ";
    }
    cout << "]" << endl;
}

void uncommize(string& s)
{
    size_t sz = s.size();
    for (size_t i = 0; i < sz; ++i) {
        if (s[i] == ',') {
            s[i] = '.';
        }
    }
}

template<class T>
Array<T>* readFromFile(const std::string& input_file_name)
{
    const size_t INIT_SIZE = 1;
    Array<T>* arr = new Array<T>(static_cast<size_t>(INIT_SIZE));
    ifstream input_file(input_file_name.c_str());

    string tmp;

    if (input_file.good()) {
        double current_number = 0;

        size_t i = 0;
        while (input_file >> tmp) {

            uncommize(tmp);
            if (stringstream(tmp) >> current_number) {
                cout << "Извлечено: " << tmp << " -> " << current_number << endl;
            } else {
                cout << "Какая-то проблема: " << tmp << endl;
            }

            if (i < INIT_SIZE) {
                cout << " (assigned)" << endl;
                (*arr)[i++] = current_number;
            } else {
                cout << " (appended)" << endl;
                arr->append(current_number);
            }
        }

        input_file.close();
    } else {
        cout << "error reading file";
    }

    return arr;
}

template<class T>
Array<T>* usrCreateArray() {
    char userInput;
    size_t length;
    std::string inputFineName;
    Array<double>* arr = NULL;
    double tmp;

    cout << "Создание массива. Выберите действие:" << endl;
    cout << "1 — Выбрать файл с массивом" << endl;
    cout << "2 — Сгенерировать массив" << endl;
    cout << "3 — Ввести массив вручную" << endl;
    cout << "0, q — Назад" << endl;

    do {
        cin >> userInput;

        switch (userInput) {
            case '0':
                userInput = 'q';
                break;
            case '1':
                cout << "Введите имя файла:" << endl << "> ";
                getline(cin, inputFineName);
                getline(cin, inputFineName);
                arr = readFromFile<double>(inputFineName);
                userInput = 'q';
                break;
            case '2':
                cout << "Введите число элементов массива:" << endl;
                cin >> length;
                arr = new Array<double>(0);
                for (size_t i = 0; i < length; ++i) {
                    arr -> append(1.0 * random() / random());
                }
                cout << "Массив сгенерирован" << endl;
                userInput = 'q';
                break;
            case '3':
                cout << "Введите число элементов массива:" << endl << "> ";
                cin >> length;
                arr = new Array<double>(0);
                for (size_t i = 0; i < length; ++i) {
                    cout << "Введите элемент > " << i + 1 << endl;
                    cin >> tmp;
                    arr -> append(tmp);
                }
                userInput = 'q';
                break;
            case 'q':
                break;
            default:
                break;
        }

    } while (userInput != 'q');

    return arr;
}

template<class T>
void usrRemoveElements(Array<T>* arr)
{
    char userInput;
    size_t index;
    double tmp;

    cout << "Удаление элементов из массива. Выберите действие:" << endl;
    cout << "1 — Удалить элемент по индексу" << endl;
    cout << "2 — Очистить массив" << endl;
    cout << "0, q — Назад" << endl;

    do {
        cin >> userInput;

        switch (userInput) {
            case '0':
                userInput = 'q';
                break;
            case '1':
                cout << "Введите индекс удаляемого элемента:" << endl << "> ";
                cin >> index;
                if (index > arr -> size() || index <= 0) {
                    cout << "Индекс элемента находится за пределами массива:" << endl;
                } else {
                    arr -> remove(index - 1);
                    userInput = 'q';
                }
                break;
            case '2':
                arr -> clear();
                cout << "Массив очищен" << endl;
                userInput = 'q';
                break;
            case 'q':
                break;
            default:
                break;
        }

    } while (userInput != 'q');
}

template<class T>
void usrSwapElements(Array<T>* arr)
{
    char userInput;
    size_t index1, index2;
    bool cond;

    cout << "Поменять местами элементы в массиве." << endl;

    cout << "Введите индекс первого элемента:" << endl;
    do {
        cin >> index1;
        cond = (index1 <= 0) || (index1 > arr -> size());
        if (cond) {
            cout << "Индекс элемента находится за пределами массива:" << endl;
        }
    } while (cond);

    cout << "Введите индекс Второго элемента:" << endl;
    do {
        cin >> index2;
        cond = (index2 <= 0) || (index2 > arr -> size());
        if (cond) {
            cout << "Индекс элемента находится за пределами массива:" << endl;
        }
    } while (cond);

    cout << "ОК, операция обмена завершена" << endl;
    arr -> swap(index1, index2);
}

template<class T>
void usrSortElements(Array<T>* arr)
{
    char userInput;
    size_t index;
    double tmp;

    cout << "Сортировка массива. Выберите действие:" << endl;
    cout << "1 — Сортировка по возрастанию" << endl;
    cout << "2 — Сортировка по убыванию" << endl;
    cout << "0, q — Назад" << endl;

    do {
        cin >> userInput;

        switch (userInput) {
            case '0':
                userInput = 'q';
                break;
            case '1':
                arr -> sort(false);
                cout << "Массив отсортирован по возрастанию" << endl;
                userInput = 'q';
                break;
            case '2':
                arr -> sort(true);
                cout << "Массив отсортирован по убыванию" << endl;
                userInput = 'q';
                break;
            case 'q':
                break;
            default:
                break;
        }

    } while (userInput != 'q');
}

char showMainMenu() {
    char userInput;

    cout << "Выберите действие:" << endl;
    cout << "1 — Создать массив" << endl;
    cout << "2 — Показать массив" << endl;
    cout << "3 — Добавить элемент(-ы)" << endl;
    cout << "4 — Удалить элемент(-ы)" << endl;
    cout << "5 — Поменять элементы местами" << endl;
    cout << "6 — Сортировать" << endl;
    cout << "7 — Среднее арифметическое" << endl;
    cout << "8 — Максимальная разность" << endl;
    cout << "9 — Среднеквадратичное отклонение" << endl;
    cout << "0 — Разница средних" << endl;
    cout << "q — выход" << endl;

    cin >> userInput;

    return userInput;
}

void testFunc()
{
    const std::string input_file_name("abc.txt");
/*
    const std::vector<int> arr = read_from_file(input_file_name);
    show_array(arr);
    Array<double> arr = Array<double>(10);
    Array<double> arr(10);
*/

    Array<double> arr;

    arr.append(1);
    arr.append(2);
    arr.append(3);
    arr.append(4);
    arr.append(5);

    cout << "indexes:" << arr[1] << "; " << arr[3] << endl;
    arr[0] = 256;

    cout << arr.size() << endl;
    arr.show();

    cout << size(arr) << endl;
    showArray(arr);

    arr.append(99);
    arr.append(7);

    arr.sort(true);
    cout << "sorted: " << endl;
    cout << arr.size() << endl;
    arr.show();

    arr.sort(false);
    cout << arr.size() << endl;
    arr.show();

    cout << "popped: " << arr.pop() << endl;
    cout << arr.size() << endl;
    arr.show();

    cout << "rm: " << arr.remove(arr.size()-1) << endl;
    cout << "rm: " << arr.remove(0) << endl;
    cout << arr.size() << endl;
    arr.show();

    cout << " ===> reading from file !!! " << endl;
    Array<double>* arr2 = readFromFile<double>(input_file_name);
    arr2->show();
}

int main(int argc, char const *argv[])
{
    setlocale(LC_ALL,"ru");

    char userInput;
    testFunc();
    std::srand(std::time(NULL));

    Array<double>* arr = NULL;
    Array<double>* arrOld = NULL;
    double tmp;

    do {
        switch (userInput = showMainMenu()) {
            case '0':
                cout << "Разность средних:" << endl;
                if (arr != NULL) {
                    cout << arr -> mean() - arr -> meanSquare() << endl;
                } else {
                    cout << "Массив ещё не создан" << endl;
                }
                break;
            case '1':
                arrOld = arr;
                arr = usrCreateArray<double>();
                if (arr != NULL) {
                    delete arrOld;
                    arrOld = NULL;
                } else {
                    arr = arrOld;
                }
                break;
            case '2':
                cout << "Массив сейчас:" << endl;
                if (arr != NULL) {
                    arr->show();
                } else {
                    cout << "Массив ещё не создан" << endl;
                }
                break;
            case '3':
                cout << "Введите добавляемый элемент:" << endl;
                if (arr != NULL) {
                    cin >> tmp;
                    arr -> append(tmp);
                } else {
                    cout << "Массив ещё не создан" << endl;
                }
                break;
            case '4':
                cout << "Удалить элементы:" << endl;
                if (arr != NULL) {
                    usrRemoveElements<double>(arr);
                } else {
                    cout << "Массив ещё не создан" << endl;
                }
                break;
            case '5':
                cout << "Поменять местами:" << endl;
                if (arr != NULL) {
                    usrSwapElements<double>(arr);
                } else {
                    cout << "Массив ещё не создан" << endl;
                }
                break;
            case '6':
                cout << "Сортировать массив" << endl;
                if (arr != NULL) {
                    usrSortElements<double>(arr);
                } else {
                    cout << "Массив ещё не создан" << endl;
                }
                break;
            case '7':
                cout << "Среднее арифметическое:" << endl;
                if (arr != NULL) {
                    cout << arr -> mean() << endl;
                } else {
                    cout << "Массив ещё не создан" << endl;
                }
                break;
            case '8':
                cout << "Максимальная разность:" << endl;
                if (arr != NULL) {
                    cout << arr -> maxDiff() << endl;
                } else {
                    cout << "Массив ещё не создан" << endl;
                }
                break;
            case '9':
                cout << "Среднеквадратичное отклонение:" << endl;
                if (arr != NULL) {
                    cout << arr -> meanSquare() << endl;
                } else {
                    cout << "Массив ещё не создан" << endl;
                }
                break;
            case 'q':
                cout << "Завершение программы" << endl;
                break;
            default:
                cout << "Неправильный символ, повторите ввод" << endl;
                break;
        }
    } while (userInput != 'q');

    cout << "Пока!" << endl;

    return 0;
}
