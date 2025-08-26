@echo off
echo Healthy Budget Coach - Flutter Commands
echo ======================================
echo.
echo Available commands:
echo 1. flutter run (Debug)
echo 2. flutter run --release
echo 3. flutter analyze
echo 4. dart format lib
echo 5. flutter clean
echo 6. flutter pub get
echo 7. flutter devices
echo 8. flutter doctor
echo.
set /p choice="Enter command number (1-8): "

if "%choice%"=="1" goto run_debug
if "%choice%"=="2" goto run_release
if "%choice%"=="3" goto analyze
if "%choice%"=="4" goto format
if "%choice%"=="5" goto clean
if "%choice%"=="6" goto pub_get
if "%choice%"=="7" goto devices
if "%choice%"=="8" goto doctor

echo Invalid choice. Please run the script again.
goto end

:run_debug
echo Running Flutter app in debug mode...
flutter run
goto end

:run_release
echo Running Flutter app in release mode...
flutter run --release
goto end

:analyze
echo Running Flutter analyze...
flutter analyze
goto end

:format
echo Formatting code...
dart format lib
goto end

:clean
echo Cleaning Flutter build...
flutter clean
goto end

:pub_get
echo Getting Flutter packages...
flutter pub get
goto end

:devices
echo Listing available devices...
flutter devices
goto end

:doctor
echo Running Flutter doctor...
flutter doctor
goto end

:end
pause
