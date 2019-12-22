#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

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
    for (int i = 0; i < arr.size(); ++i) {
        cout << arr[i] << ", " << endl;
    }
}

int main(int argc, char const *argv[])
{
    const std::string input_file_name("abc.txt");
    const std::vector<int> arr = read_from_file(input_file_name);

    show_array(arr);

    return 0;
}
