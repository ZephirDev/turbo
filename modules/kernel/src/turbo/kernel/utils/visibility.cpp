//
// Created by desrumaux on 19/06/24.
//

#include "visibility.hpp"

#include <stdexcept>

namespace turbo::kernel::utils
{

        std::string visibility::to_string(const types::visibility& visibility)
        {
                switch (visibility) {
                case types::PRIVATE:
                        return "private";

                case types::PROTECTED:
                        return "protected";

                case types::PUBLIC:
                        return "public";

                default:
                        throw std::invalid_argument{"visibility value can't be stringified because it's not defined on the enumeration."};
                }
        }

        types::visibility visibility::from_string(const std::string& visibility)
        {
                if (visibility == "private")
                {
                        return types::visibility::PRIVATE;
                }
                else if (visibility == "protected")
                {
                        return types::visibility::PROTECTED;
                }
                else if (visibility == "public")
                {
                        return types::visibility::PUBLIC;
                }
                else
                {
                        throw std::invalid_argument{"visibility string value can't be parsed because it's not defined on the enumeration."};
                }
        }

        bool visibility::is_private(const types::visibility& visibility)
        {
                return types::visibility::PRIVATE == visibility;
        }

        bool visibility::is_protected(const types::visibility& visibility)
        {
                return types::visibility::PROTECTED == visibility;
        }

        bool visibility::is_public(const types::visibility& visibility)
        {
                return types::visibility::PUBLIC == visibility;
        }

}
