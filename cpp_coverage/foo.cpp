#include <unordered_map>
#include <iostream>


int main(){
	static std::unordered_map<int, int>new_map = {{}};
	int var = 0;
	if (var == 1) {
		std::cout << "Hi" << std::endl;
	}
	else {
		std::cout << "Hi" << std::endl;
	}
}
