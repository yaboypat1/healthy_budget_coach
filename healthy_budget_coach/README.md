# Healthy Budget Coach

A Flutter application for personal budget management and financial coaching.

[![Flutter](https://img.shields.io/badge/Flutter-3.24.5+-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.5.4+-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.24.5+)
- Android Studio with Android SDK
- Java 17 JDK
- Android device or emulator

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd healthy_budget_coach
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🛠️ Development

### Cursor IDE Configuration

The project includes pre-configured Cursor IDE settings:

- **Tasks** (Ctrl+Shift+P → "Tasks: Run Task"):
  - `Flutter: Analyze` - Run code analysis
  - `Flutter: Format` - Format code with dart format
  - `Flutter: Run (Debug)` - Run in debug mode
  - `Flutter: Run (Release)` - Run in release mode
  - `Flutter: Clean` - Clean build artifacts
  - `Flutter: Get Packages` - Install dependencies

- **Debug Configurations** (F5):
  - Flutter (Debug)
  - Flutter (Profile)
  - Flutter (Release)

### Android Configuration

- **Target SDK**: API 36 (Android 14)
- **Minimum SDK**: API 23 (Android 6.0)
- **Compile SDK**: API 36
- **Java Version**: 17

### Device Connection

To connect your Pixel 9 Pro XL:

1. **Enable Developer Options**:
   - Go to Settings → About Phone
   - Tap "Build Number" 7 times
   - Go to Settings → Developer Options
   - Enable "USB Debugging"

2. **Connect via USB**:
   - Connect your device via USB
   - Allow USB debugging when prompted
   - Run `flutter devices` to verify connection

3. **Run on device**:
   ```bash
   flutter run -d <device_id>
   ```

## 📱 Building

### Debug Build
```bash
flutter run
```

### Release Build
```bash
flutter run --release
```

### APK Build
```bash
flutter build apk --release
```

## 🔧 Troubleshooting

### Flutter Doctor Issues
```bash
flutter doctor
flutter doctor --android-licenses
```

### Clean Build
```bash
flutter clean
flutter pub get
```

### Update Flutter
```bash
flutter upgrade
```

## 📁 Project Structure

```
healthy_budget_coach/
├── android/          # Android-specific configuration
├── ios/             # iOS-specific configuration
├── lib/             # Dart source code
├── test/            # Test files
├── .vscode/         # Cursor IDE configuration
└── pubspec.yaml     # Dependencies and project metadata
```

## 🎨 UI Framework

This app uses Material 3 expressive UI components for a modern, accessible design.

## 📄 License

[Your License Here]

## 🤝 Contributing

[Your Contributing Guidelines Here]

## Step 1: Create a `.gitignore` file

First, let's create a proper `.gitignore` file for your Flutter project:

```gitignore:healthy_budget_coach/.gitignore
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.buildlog/
.history
.svn/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.packages
.pub-cache/
.pub/
/build/

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release

# iOS related
**/ios/**/*.mode1v3
**/ios/**/*.mode2v3
**/ios/**/*.moved-aside
**/ios/**/*.pbxuser
**/ios/**/*.perspectivev3
**/ios/**/*sync/
**/ios/**/.sconsign.dblite
**/ios/**/.tags*
**/ios/**/.vagrant/
**/ios/**/DerivedData/
**/ios/**/Icon?
**/ios/**/Pods/
**/ios/**/.symlinks/
**/ios/**/profile
**/ios/**/xcuserdata
**/ios/.generated/
**/ios/Flutter/App.framework
**/ios/Flutter/Flutter.framework
**/ios/Flutter/Flutter.podspec
**/ios/Flutter/Generated.xcconfig
**/ios/Flutter/app.flx
**/ios/Flutter/app.zip
**/ios/Flutter/flutter_assets/
**/ios/Flutter/flutter_export_environment.sh
**/ios/ServiceDefinitions.json
**/ios/Runner/GeneratedPluginRegistrant.*

# macOS
**/macos/Flutter/GeneratedPluginRegistrant.swift

# Coverage
coverage/

# Exceptions to above rules.
!**/ios/**/default.mode1v3
!**/ios/**/default.mode2v3
!**/ios/**/default.pbxuser
!**/ios/**/default.perspectivev3
!/packages/flutter_tools/test/data/dart_dependencies_test/**/.packages

# FVM
.fvm/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local
```

## Step 2: Initialize Git Repository

Now you need to run these commands in your terminal from the project root directory:

```bash
# Navigate to your project directory
cd healthy_budget_coach

# Initialize git repository
git init

# Add all files
git add .

# Make initial commit
git commit -m "Initial commit: Healthy Budget Coach Flutter app"
```

## Step 3: Create GitHub Repository

1. Go to [GitHub.com](https://github.com) and sign in
2. Click the "+" icon in the top right corner
3. Select "New repository"
4. Name it: `healthy_budget_coach`
5. Description: `A Flutter application for personal budget management and financial coaching`
6. Make it **Public** or **Private** (your choice)
7. **Don't** initialize with README, .gitignore, or license (since you already have these)
8. Click "Create repository"

## Step 4: Connect Local Repository to GitHub

After creating the GitHub repository, you'll see instructions. Run these commands:

```bash
# Add the remote origin (replace YOUR_USERNAME with your actual GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/healthy_budget_coach.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 5: Update README (Optional)

Your README is already excellent, but you might want to add a few GitHub-specific badges. You can add this near the top of your README:

```markdown:healthy_budget_coach/README.md
<code_block_to_apply_changes_from>
```

## Step 6: Create a LI
