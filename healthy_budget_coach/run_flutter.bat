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

if "%choice%"=="1" (
    echo Running Flutter app in debug mode...
    flutter run
) else if "%choice%"=="2" (
    echo Running Flutter app in release mode...
    flutter run --release
) else if "%choice%"=="3" (
    echo Running Flutter analyze...
    flutter analyze
) else if "%choice%"=="4" (
    echo Formatting code...
    dart format lib
) else if "%choice%"=="5" (
    echo Cleaning Flutter build...
    flutter clean
) else if "%choice%"=="6" (
    echo Getting Flutter packages...
    flutter pub get
) else if "%choice%"=="7" (
    echo Listing available devices...
    flutter devices
) else if "%choice%"=="8" (
    echo Running Flutter doctor...
    flutter doctor
) else (
    echo Invalid choice. Please run the script again.
)

pause
