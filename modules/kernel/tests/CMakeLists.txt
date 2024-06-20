add_executable(kernel_tests
        main.cpp
        C01_basic_usage.cpp
        CXX_types.cpp)
target_link_libraries(kernel_tests
  GTest::GTest
  kernel
  ${ADDITIONAL_TEST_BINARY})
add_test(${PROJECT_NAME}_gtests kernel_tests --gtest_output=xml:${CMAKE_BINARY_DIR}/reports/kernel.xml)
