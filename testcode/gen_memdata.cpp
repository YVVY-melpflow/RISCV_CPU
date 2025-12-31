#include <iostream>
using namespace std;

int main(void) {
  string Sin;
  int count = 0;

  getline(cin, Sin);
  while (getline(cin, Sin)) {
    for (int i = 0; i < Sin.size() / 12; i++) {
      cout << Sin[12*i + 9] << Sin[12*i + 10];
      cout << Sin[12*i + 6] << Sin[12*i +  7];
      cout << Sin[12*i + 3] << Sin[12*i +  4];
      cout << Sin[12*i    ] << Sin[12*i +  1] << endl;
      count++;
    }
  }

  while (count < 256) {
    cout << "00000000" << endl;
    count++;
  }
}
