
find_package(Eigen2)
if (EIGEN2_FOUND)

  include_directories(${EIGEN2_INCLUDE_DIR})
  btl_add_bench(btl_eigen3_linear main_linear.cpp)
  btl_add_bench(btl_eigen3_vecmat main_vecmat.cpp)
  btl_add_bench(btl_eigen3_matmat main_matmat.cpp)
  btl_add_bench(btl_eigen3_adv main_adv.cpp      )

  btl_add_target_property(btl_eigen3_linear COMPILE_FLAGS "-fno-exceptions -DBTL_PREFIX=eigen3")
  btl_add_target_property(btl_eigen3_vecmat COMPILE_FLAGS "-fno-exceptions -DBTL_PREFIX=eigen3")
  btl_add_target_property(btl_eigen3_matmat COMPILE_FLAGS "-fno-exceptions -DBTL_PREFIX=eigen3")
  btl_add_target_property(btl_eigen3_adv    COMPILE_FLAGS "-fno-exceptions -DBTL_PREFIX=eigen3")

  option(BTL_BENCH_NOGCCVEC "also bench Eigen explicit vec without GCC's auto vec" OFF)
  if(CMAKE_COMPILER_IS_GNUCXX AND BTL_BENCH_NOGCCVEC)
    btl_add_bench(btl_eigen3_nogccvec_linear main_linear.cpp)
    btl_add_bench(btl_eigen3_nogccvec_vecmat main_vecmat.cpp)
    btl_add_bench(btl_eigen3_nogccvec_matmat main_matmat.cpp)
    btl_add_bench(btl_eigen3_nogccvec_adv    main_adv.cpp   )

    btl_add_target_property(btl_eigen3_nogccvec_linear COMPILE_FLAGS "-fno-exceptions -fno-tree-vectorize -DBTL_PREFIX=eigen3_nogccvec")
    btl_add_target_property(btl_eigen3_nogccvec_vecmat COMPILE_FLAGS "-fno-exceptions -fno-tree-vectorize -DBTL_PREFIX=eigen3_nogccvec")
    btl_add_target_property(btl_eigen3_nogccvec_matmat COMPILE_FLAGS "-fno-exceptions -fno-tree-vectorize -DBTL_PREFIX=eigen3_nogccvec")
    btl_add_target_property(btl_eigen3_nogccvec_adv    COMPILE_FLAGS "-fno-exceptions -fno-tree-vectorize -DBTL_PREFIX=eigen3_nogccvec")
  endif()


  if(NOT BTL_NOVEC)
    btl_add_bench(btl_eigen3_novec_linear main_linear.cpp)
    btl_add_bench(btl_eigen3_novec_vecmat main_vecmat.cpp)
    btl_add_bench(btl_eigen3_novec_matmat main_matmat.cpp)
    btl_add_bench(btl_eigen3_novec_adv main_adv.cpp      )
    btl_add_target_property(btl_eigen3_novec_linear COMPILE_FLAGS "-fno-exceptions -DEIGEN_DONT_VECTORIZE -DBTL_PREFIX=eigen3_novec")
    btl_add_target_property(btl_eigen3_novec_vecmat COMPILE_FLAGS "-fno-exceptions -DEIGEN_DONT_VECTORIZE -DBTL_PREFIX=eigen3_novec")
    btl_add_target_property(btl_eigen3_novec_matmat COMPILE_FLAGS "-fno-exceptions -DEIGEN_DONT_VECTORIZE -DBTL_PREFIX=eigen3_novec")
    btl_add_target_property(btl_eigen3_novec_adv    COMPILE_FLAGS "-fno-exceptions -DEIGEN_DONT_VECTORIZE -DBTL_PREFIX=eigen3_novec")

#     if(BUILD_btl_eigen3_adv)
#       target_link_libraries(btl_eigen3_adv ${MKL_LIBRARIES})
#     endif(BUILD_btl_eigen3_adv)

  endif(NOT BTL_NOVEC)

  btl_add_bench(btl_tiny_eigen3 btl_tiny_eigen3.cpp OFF)

  if(NOT BTL_NOVEC)
    btl_add_bench(btl_tiny_eigen3_novec btl_tiny_eigen3.cpp OFF)
    btl_add_target_property(btl_tiny_eigen3_novec    COMPILE_FLAGS "-DBTL_PREFIX=eigen3_tiny")

    if(BUILD_btl_tiny_eigen3_novec)
      btl_add_target_property(btl_tiny_eigen3_novec    COMPILE_FLAGS "-DEIGEN_DONT_VECTORIZE -DBTL_PREFIX=eigen3_tiny_novec")
    endif(BUILD_btl_tiny_eigen3_novec)
  endif(NOT BTL_NOVEC)

endif (EIGEN2_FOUND)
