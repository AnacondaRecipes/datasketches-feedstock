mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -D CMAKE_BUILD_TYPE=Release ^
    -D HDF5_INCLUDE_DIR=%LIBRARY_PREFIX%\include ^
    -D HDF5_LIB_PATH=%LIBRARY_PREFIX%\lib ^
    -G "NMake Makefiles" ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

nmake test
if errorlevel 1 exit 1

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv
