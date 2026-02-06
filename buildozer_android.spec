[app]

# (str) Title of your application
title = Student Tracker Pro

# (str) Package name
package.name = studenttrackerpro

# (str) Package domain
package.domain = com.younesbennacer

# (str) Source code where the main.py live
source.dir = .

# (list) Source files to include
source.include_exts = py,png,jpg,kv,atlas,json,db

# (list) List of inclusions using pattern matching
source.include_patterns = student_rosters.json

# (str) Application versioning
version = 2.0.1

# (list) Application requirements
# CRITICAL: Removed pandas - it causes crashes on Android
# Using only lightweight, Android-compatible libraries
requirements = python3,kivy==2.2.1,android,pyjnius,pillow,openpyxl,et-xmlfile,six

# (str) Supported orientation
orientation = portrait

# (list) Permissions
# CRITICAL: Essential permissions for file access
android.permissions = WRITE_EXTERNAL_STORAGE,READ_EXTERNAL_STORAGE,INTERNET

# (int) Target Android API
android.api = 31

# (int) Minimum API
android.minapi = 21

# (int) Android SDK version to use
android.sdk = 31

# (str) Android NDK version to use
android.ndk = 25b

# (bool) Accept SDK license automatically
android.accept_sdk_license = True

# (str) Android logcat filters
android.logcat_filters = *:S python:D

# (str) Android arch to build for
# Building for both architectures for maximum compatibility
android.archs = arm64-v8a,armeabi-v7a

# (bool) enables Android auto backup
android.allow_backup = True

# CRITICAL: Add this for Android 11+ compatibility
android.gradle_dependencies = 

# CRITICAL: Manifest settings for file access
android.add_src = 

[buildozer]

# (int) Log level (0 = error only, 1 = info, 2 = debug)
log_level = 2

# (int) Display warning if buildozer is run as root
warn_on_root = 1

# (str) Path to build artifact storage
# build_dir = ./.buildozer

# (str) Path to build output
# bin_dir = ./bin
