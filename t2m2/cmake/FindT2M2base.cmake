# Find the native T2M2BASE headers and libraries.
#
#  T2M2BASE_LIBRARIES    - List of libraries when using nana.
#  T2M2BASE_FOUND        - True if nana found.

# Look for the library.
FIND_LIBRARY(T2M2BASE_LIBRARY NAMES FOSSSimT2M2base HINTS ${CMAKE_SOURCE_DIR}/lib)
MARK_AS_ADVANCED(T2M2BASE_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set T2M2BASE_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(T2M2BASE DEFAULT_MSG T2M2BASE_LIBRARY)

IF(T2M2BASE_FOUND)
  SET(T2M2BASE_LIBRARIES ${T2M2BASE_LIBRARY})
ELSE(T2M2BASE_FOUND)
  SET(T2M2BASE_LIBRARIES)
ENDIF(T2M2BASE_FOUND)