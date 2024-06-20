add_compile_options(--coverage -fprofile-arcs -ftest-coverage)
list(APPEND ADDITIONAL_PROD_LIB gcov)
list(APPEND ADDITIONAL_TEST_BINARY gcov)
