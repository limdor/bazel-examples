#define CATCH_CONFIG_MAIN

#include <catch2/catch.hpp>

int sum( int left, int right ) {
    return left + right;
}

TEST_CASE( "Sum negative values", "[sum]" ) {
    REQUIRE( sum(-2, -5) == -7 );
}

TEST_CASE( "Sum positive values", "[sum]" ) {
    REQUIRE( sum(1, 5) == 6 );
}
