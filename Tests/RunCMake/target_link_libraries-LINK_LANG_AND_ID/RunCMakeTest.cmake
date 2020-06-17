include(RunCMake)

macro(run_cmake_target test subtest target)
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/${test}-build)
  set(RunCMake_TEST_NO_CLEAN 1)
  run_cmake_command(${test}-${subtest} ${CMAKE_COMMAND} --build . --target ${target} ${ARGN})

  unset(RunCMake_TEST_BINARY_DIR)
  unset(RunCMake_TEST_NO_CLEAN)
endmacro()

if (RunCMake_GENERATOR MATCHES "Makefiles|Ninja|Visual Studio|Xcode|Watcom WMake")

  run_cmake(genex_LINK_LANG_AND_ID-bad-mix-lang)

  set(RunCMake_TEST_OUTPUT_MERGE TRUE)
  if (NOT RunCMake_GENERATOR_IS_MULTI_CONFIG)
    set(RunCMake_TEST_OPTIONS -DCMAKE_BUILD_TYPE=Release)
  endif()

  run_cmake(genex_LINK_LANG_AND_ID)

  run_cmake_target(genex_LINK_LANG_AND_ID lib LinkLibraries_lib --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID lib2 LinkLibraries_lib2 --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID lib3 LinkLibraries_lib3 --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID exe LinkLibraries_exe --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID C_import LinkLibraries_C_import --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID CXX_import LinkLibraries_CXX_import --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID C_interface LinkLibraries_C_interface --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID CXX_interface LinkLibraries_CXX_interface --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID C_interface2 LinkLibraries_C_interface2 --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID CXX_interface2 LinkLibraries_CXX_interface2 --config Release)
  run_cmake_target(genex_LINK_LANG_AND_ID CXX_static LinkLibraries_CXX_static --config Release)

  unset(RunCMake_TEST_OPTIONS)
  unset(RunCMake_TEST_OUTPUT_MERGE)

endif()
