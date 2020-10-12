#include "foo.h"

namespace foo
{
    int foo(int x, int y)
    {
        int z = 0;
        if ((x > 0) && (y > 0))
        {
            z = x;
        }
        return z;
    }
} // namespace foo
