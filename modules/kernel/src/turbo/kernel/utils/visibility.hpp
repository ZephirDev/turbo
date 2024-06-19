//
// Created by desrumaux on 19/06/24.
//

#pragma once

#include <string>

#include "turbo/kernel/types/visibility.hpp"

namespace turbo::kernel::utils
{

    namespace visibility
    {

        std::string to_string(const types::visibility& visibility);

        types::visibility from_string(const std::string& visibility);

        bool is_private(const types::visibility& visibility);

        bool is_protected(const types::visibility& visibility);

        bool is_public(const types::visibility& visibility);

    }

}
