from lib import sum

if __name__ == '__main__':
    test_pass = sum(5, 7) == 12
    if(test_pass):
        exit(0)
    else:
        # Any return different than 0 will be understood by Bazel as a failure
        exit(-1)
