include_directories(src)
add_library(kernel SHARED
    src/turbo/kernel/kernel.hpp
    src/turbo/kernel/handler.cpp
    src/turbo/kernel/handler.cpp
    src/turbo/kernel/handler.hpp
        src/turbo/kernel/service.cpp
        src/turbo/kernel/service.hpp
        src/turbo/kernel/module.cpp
        src/turbo/kernel/module.hpp
        src/turbo/kernel/types/visibility.cpp
        src/turbo/kernel/types/visibility.hpp
        src/turbo/kernel/utils/visibility.cpp
        src/turbo/kernel/utils/visibility.hpp)

if (CMAKE_TESTING_ENABLED)
    add_subdirectory(tests)
endif ()
