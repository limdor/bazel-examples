#include "foo.h"

#include <catch2/catch_test_macros.hpp>

TEST_CASE("foo(-1,1)", "[foo]")
{
    REQUIRE(foo::foo(-1, 1) == 0);
}
