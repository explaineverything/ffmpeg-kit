#!/bin/bash

# FFmpeg-Kit Custom Build Script
# Builds FFmpeg-kit with all architectures including x86/x86_64

set -e

echo "🏗️  FFmpeg-Kit Custom Build Process"
echo "================================="

# Set environment variables
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$HOME/Library/Android/sdk"  # For Gradle compatibility
export ANDROID_NDK_ROOT="$HOME/Library/Android/sdk/ndk/25.2.9519653"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"

echo "✅ Android SDK: $ANDROID_SDK_ROOT"
echo "✅ Android Home: $ANDROID_HOME"
echo "✅ Android NDK: $ANDROID_NDK_ROOT"
echo "✅ Java Home: $JAVA_HOME"

# Verify Java version
echo "✅ Java Version: $("$JAVA_HOME/bin/java" -version 2>&1 | head -n 1)"

echo ""
echo "🎯 Starting build with all architectures:"
echo "   - arm64-v8a"
echo "   - x86_64"
echo ""

# Start the build
echo "⏱️  This will take some time..."
echo "🚀 Starting build now..."

# Build with the EE Android feature set required by the whiteboard SDK.
# Keep Android MediaCodec decoding enabled for large inputs such as 4K HEVC MOV.
# Keep MP3 encoding enabled because `EEAssetsMultimediaConverter` converts
# supported imported audio formats (including `.au`) to `.mp3`.
./android.sh \
  --disable-arm-v7a \
  --disable-arm-v7a-neon \
  --disable-x86 \
  --enable-android-media-codec \
  --enable-openh264 \
  --enable-lame

echo ""
echo "✅ Build completed!"
echo "📦 AAR created at:"
echo "   prebuilt/bundle-android-aar/ffmpeg-kit/ffmpeg-kit.aar"
echo ""
echo "🔍 Architecture verification:"
unzip -l prebuilt/bundle-android-aar/ffmpeg-kit/ffmpeg-kit.aar | grep -E "jni/(arm64|armeabi|x86)" | cut -d'/' -f2 | sort | uniq | sed 's/^/   ✅ /'