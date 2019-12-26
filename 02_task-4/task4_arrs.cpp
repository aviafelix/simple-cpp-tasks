#include <iostream>
#include <cmath>

using namespace std;

typedef struct Array {
    int size;
    double *arr;
} Array;

Array* createArray(int size)
{
    Array* arr = new Array;
    arr -> size = size;
    arr -> arr = new double[size];

    return arr;
}

void swapArr(double* arr, int m, int n)
{
    double temp;
    temp = arr[m];
    arr[m] = arr[n];
    arr[n] = temp;
}

void showArr(Array *a)
{
    for (int i = 0; i < a -> size; i++)
    {
        cout << a -> arr[i] << ",";
    }
}

void changeArr(Array* a)
{   
    int x, y;
    cout << "Введите элемента массива,которые хотите поменять" << endl;

    cin >> x >> y;
    swapArr(a -> arr, x, y);

    cout << "Ваш видоизменённый масссив";
    showArr(a);
}

void sortAsc(Array* a)
{
    int answ3;
    int size = a -> size;
    double *arr = a -> arr;
    cout << "1-Отсортировать массив по возрастанию\n";
    cout << "2-Отсортировать массив по убыванию";
    cin >> answ3;
    switch(+answ3)
    {

    case 1:
        for (int i = 0; i < size - 1; i++)
        {
            for (int j = i + 1; j < size; j++)
            {
                if (arr[i] > arr[j])
                {
                    swap(arr[j], arr[i]);
                }
            }
        }
        cout << "Массив отсортированный по возрастанию" << endl;
        showArr(a);
    break;

    case 2:
        for (int i = 0; i < size - 1; i++)
        {
            for (int j = size - 1; j > i; j--)
            {
                if (arr[j-1] < arr[j])
                {
                    swap(arr[j], arr[j-1]);
                }
            }
        }
        cout << "Массив отсортированный по убыванию" << endl;
        showArr(a);
        break;
    }
}

void mean(Array* a)
{
    double M = 0, srar;
    int size = a -> size;
    double* arr = a -> arr;
    for (int i = 0; i < size; i++)
    {
        M += arr[i];
    }
    srar = M/size;
    cout << "Среднее арифметическое:" << srar << endl;
}

void appendElement(Array* a) {
   double* arr = a -> arr;
   int size = a -> size;
   double* new_arr = new double[size +1];
   double b;
    for (int i = 0; i < size; ++i) {
       new_arr[i] = arr[i];
   }
   delete[] arr;
    a -> arr = new_arr;
    a -> size = size + 1;
    cout << "Введите элемент который хотите добавить" << endl;
    cin >> b;
   new_arr[size] = b;  
    for (int i = 0; i < size+1; ++i) {
        cout <<  new_arr[i] << " ";
   }
     
}

void maxrazn(Array *a)
{
    double* arr = a -> arr;
    int size = a -> size;
    int max = 0;
     for (int i = 0; i < size; i++)
    {
        if (max < arr[i])
        {
            max = arr[i];
        }
    }
    int min = arr[0];
     for (int i = 0; i < size; i++)
    {
        if (arr[i] < min)
        {
            min = arr[i];
        }
    }
    cout << "Максимальная разность" << max - min << endl;
}

void srarsqr(Array* a)
{
    double* arr = a -> arr;
    int size = a -> size;
    double M = 0, S, srar;
    double sum1 = 0;

    for (int i = 0; i < size; i++)
    {
        M += arr[i];
    }
    srar = M / size;

    for (int i = 0; i < size; i++)
    {   
        sum1 += (arr[i] - srar) * (arr[i] - srar);
    }
    S = sqrt(sum1 / (size - 1));
    cout << "Среднеквадратичное отклонение: " << S << endl;
    
}

void delel(Array* a)
{
    double* arr = a -> arr;
    int size = a -> size;
    int k, change;

    cout << "Введите элемент который хотите удалить" << endl;
    cin >> k;
    cout  << "Массив без " << k << " элемента: "; 

    for (int i = 0; i < size - 1; i++) 
    { 
        if (i >= k - 1) 
        {
            change = arr[i]; 
            arr[i] = arr[i + 1]; 
            arr[i + 1] = change;
        }
        cout << arr[i] << " ";
    }
}

int main()
{
    setlocale(LC_ALL,"ru");
    double arr[100], arr2[6] = {1, 2.5, 3.4, 67, 32, 6};
     
    int n, answ, opt, answ2;
     
    cout << "Введите размер массива" << endl;
    cin >> n;
    Array* a = createArray(n);
    cout << "Вы хотите ввести массив самостоятельно: 1-да, 2-нет " << endl;
    cin >> answ;
    if (answ == 1)
    {
        for (int i = 0; i <n; i++)
        {
            cout << "Введите" << i + 1 << "элемент массива" << endl;
            cin >> a -> arr[i];
        }
    }
    else if (answ == 2)
    {
        for (int i = 0; i < 6; i++)
        {
            cout << arr2[i] << ",";
        }
        cout << endl;
    }
     
    cout << "Выберите опцию\n"
         << "1-показать массив,который вы ввели\n"
         << "2-поменять в вашем массиве элементы местами\n"
         << "3-отсортировать массив\n"
         << "4-найти среднее арифметическое\n"
         << "5-добавить элемент в массив\n"
         << "6-Максимальная разность массива\n"
         << "7-Среднеквадратичное отклонение\n"
         << "8-Удалить элемент из массива\n";
    cin >> opt;
     
    switch (opt)
    {
        case 1:
            showArr(a); 
            break;
        case 2:
            changeArr(a);
            break;
        case 3:
            sortAsc(a);
            break;
        case 4:
            mean(a);
            break;
        case 5:
            appendElement(a);
            break;
        case 6:
            maxrazn(a);
            break;
        case 7:
            srarsqr(a);
            break;
        case 8:
            delel(a);
            break;
    }
}
