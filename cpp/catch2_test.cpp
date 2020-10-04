#include "my_lib.h"

int main(){
    bool test_pass = my_lib::sum(-2, -5) == -7;
    if(test_pass){
        return 0;
    } else {
        // Any return different than 0 will be understood by Bazel as a failure
        return -1;
    }
}
