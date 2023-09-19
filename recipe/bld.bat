:: cmd
echo "Building %PKG_NAME%."


mkdir build
cd build
if errorlevel 1 exit /b 1

:: Generate the build files.
echo "Generating the build files..."
cmake .. %CMAKE_ARGS% ^
    -G"Ninja" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
if errorlevel 1 exit 1

:: Build.
echo "Building..."
ninja -j%CPU_COUNT%
if errorlevel 1 exit /b 1

:: Install.
echo "Installing..."
ninja install
if errorlevel 1 exit /b 1

cd ..
if errorlevel 1 exit /b 1

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv

:: Error free exit.
echo "Error free exit!"
exit 0
