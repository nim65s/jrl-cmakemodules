# .rst: .. command: FETCH_EIGEN3(EIGEN3_VERSION)
macro(FETCH_EIGEN3 EIGEN3_VERSION)
  if(${CMAKE_VERSION} VERSION_LESS "3.14")
    message(WARNING "can't use FetchContent with CMake ${CMAKE_VERSION} < 3.11")
  else()
    include(FetchContent)
    FetchContent_Declare(
      Eigen3
      GIT_REPOSITORY https://gitlab.com/libeigen/eigen
      GIT_TAG ${EIGEN3_VERSION}
      )
    set(BUILD_TESTING OFF)
    FetchContent_MakeAvailable(Eigen3)
  endif()
endmacro()
