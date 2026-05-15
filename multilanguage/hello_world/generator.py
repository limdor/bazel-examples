import argparse
import os

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input_file", help="Text file containing the message to be displayed in the hello world")
    parser.add_argument("output_file", help="Cpp file that will contain the hello world program with the provided message")
    args = parser.parse_args()
    hello_world_message = "World"
    with open(args.input_file, 'r') as message_file:
        hello_world_message = message_file.readline()
    with open(args.output_file, 'w') as hello_world_program_file:
        hello_world_program_file.write('#include <iostream>\n')
        hello_world_program_file.write('\n')
        hello_world_program_file.write('int main()\n')
        hello_world_program_file.write('{\n')
        hello_world_program_file.write(f'    std::cout << "Hello {hello_world_message}!" << std::endl;\n')
        hello_world_program_file.write('}\n')

if __name__ == "__main__":
    main()
