//
// Created by desrumaux on 19/06/24.
//

#include <gtest/gtest.h>

#include <stdexcept>

#include "turbo/kernel/types/visibility.hpp"
#include "turbo/kernel/utils/visibility.hpp"

TEST(CXX_types, visibility) {
    using namespace turbo::kernel;
    using namespace turbo::kernel::utils;

    ASSERT_TRUE(visibility::is_private(types::visibility::PRIVATE));
    ASSERT_FALSE(visibility::is_private(types::visibility::PROTECTED));
    ASSERT_FALSE(visibility::is_private(types::visibility::PUBLIC));

    ASSERT_FALSE(visibility::is_protected(types::visibility::PRIVATE));
    ASSERT_TRUE(visibility::is_protected(types::visibility::PROTECTED));
    ASSERT_FALSE(visibility::is_protected(types::visibility::PUBLIC));

    ASSERT_FALSE(visibility::is_public(types::visibility::PRIVATE));
    ASSERT_FALSE(visibility::is_public(types::visibility::PROTECTED));
    ASSERT_TRUE(visibility::is_public(types::visibility::PUBLIC));

    ASSERT_EQ(visibility::from_string("private"), types::visibility::PRIVATE);
    ASSERT_EQ(visibility::from_string("protected"), types::visibility::PROTECTED);
    ASSERT_EQ(visibility::from_string("public"), types::visibility::PUBLIC);
    ASSERT_THROW(visibility::from_string("undefined"), std::invalid_argument);

    ASSERT_EQ(visibility::to_string(types::visibility::PRIVATE), "private");
    ASSERT_EQ(visibility::to_string(types::visibility::PROTECTED), "protected");
    ASSERT_EQ(visibility::to_string(types::visibility::PUBLIC), "public");
    ASSERT_THROW(visibility::to_string(static_cast<types::visibility>(1'000'000)), std::invalid_argument);
}
