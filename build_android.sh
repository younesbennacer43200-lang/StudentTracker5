#!/bin/bash
# build_android.sh - Automated Android APK Builder
# Student Tracker Pro v2.0.1

set -e  # Exit on error

echo "🚀 Student Tracker Pro - Android APK Builder"
echo "============================================="
echo ""

# Check if we're in the right directory
if [ ! -f "main_android.py" ]; then
    echo "❌ Error: main_android.py not found!"
    echo "Please run this script from the project directory."
    exit 1
fi

if [ ! -f "student_rosters.json" ]; then
    echo "❌ Error: student_rosters.json not found!"
    echo "Please ensure the student roster file is in the project directory."
    exit 1
fi

# Clean old builds
echo "🧹 Cleaning old builds..."
rm -rf .buildozer
rm -rf bin
echo "✅ Old builds cleaned"
echo ""

# Prepare files
echo "📝 Preparing files for Android build..."
cp main_android.py main.py
echo "  ✓ Copied main_android.py → main.py"

if [ -f "buildozer_android.spec" ]; then
    cp buildozer_android.spec buildozer.spec
    echo "  ✓ Copied buildozer_android.spec → buildozer.spec"
else
    echo "  ⚠️  Warning: buildozer_android.spec not found, using existing buildozer.spec"
fi

echo "  ✓ student_rosters.json ready"
echo ""

# Check buildozer installation
if ! command -v buildozer &> /dev/null; then
    echo "❌ Error: buildozer not installed!"
    echo ""
    echo "Install buildozer with:"
    echo "  pip install buildozer"
    echo ""
    exit 1
fi

# Check Java
if ! command -v java &> /dev/null; then
    echo "⚠️  Warning: Java not found!"
    echo "Buildozer may fail without Java JDK."
    echo ""
    echo "Install Java with:"
    echo "  sudo apt install openjdk-17-jdk  # Ubuntu/Debian"
    echo "  brew install openjdk@17          # macOS"
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Build APK
echo "🔨 Building Android APK..."
echo "This may take 20-30 minutes on first build..."
echo ""

if buildozer -v android debug; then
    echo ""
    echo "🎉 ============================================= 🎉"
    echo "✅ BUILD SUCCESSFUL!"
    echo "================================================="
    echo ""
    echo "📦 APK Location:"
    ls -lh bin/*.apk
    echo ""
    echo "📱 To install on your Android device:"
    echo "   1. Enable USB debugging on your phone"
    echo "   2. Connect phone via USB"
    echo "   3. Run: adb install -r bin/studenttrackerpro-*.apk"
    echo ""
    echo "Or copy the APK to your phone and install manually."
    echo ""
else
    echo ""
    echo "❌ ============================================= ❌"
    echo "BUILD FAILED!"
    echo "================================================="
    echo ""
    echo "Common fixes:"
    echo "1. Check that all dependencies are installed"
    echo "2. Try: buildozer android clean"
    echo "3. Check the build log above for specific errors"
    echo "4. See ANDROID_FIX_GUIDE.md for troubleshooting"
    echo ""
    exit 1
fi
