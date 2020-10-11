#define CATCH_CONFIG_MAIN

#include "foo.h"
#include <catch2/catch.hpp>

TEST_CASE("foo(-1,1)", "[foo]")
{
    REQUIRE(foo::foo(-1, 1) == 0);
}
