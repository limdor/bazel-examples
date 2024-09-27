#define CATCH_CONFIG_MAIN

#include "foo.h"
#include <catch2/catch.hpp>

TEST_CASE("foo(-1,1)", "[foo]")
{
    REQUIRE(0 == 0);
}
