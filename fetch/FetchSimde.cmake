# .rst: .. command: FETCH_SIMDE(SIMDE_VERSION)
macro(FETCH_SIMDE SIMDE_VERSION)
  if(${CMAKE_VERSION} VERSION_LESS "3.14")
    message(WARNING "can't use FetchContent with CMake ${CMAKE_VERSION} < 3.11")
  else()
    include(FetchContent)
    FetchContent_Declare(
      Simde
      GIT_REPOSITORY https://github.com/simd-everywhere/simde
      GIT_TAG        ${SIMDE_VERSION}
      )
    FetchContent_MakeAvailable(Simde)
    set(Simde_INCLUDE_DIR ${simde_SOURCE_DIR})
  endif()
endmacro()
