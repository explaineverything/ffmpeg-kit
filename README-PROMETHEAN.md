# FFmpeg-Kit Custom Build Instructions

This repo contains a fork of now-archived ffmpeg-kit repo. We keep it to maintain and own building process, to ensure ffmpeg libraries used by Promethean / Explain Everything are clear of any proprietary (GPL-licenced) parts.

## 📁 Location
This is the **PROMETHEAN fork** of ffmpeg-kit with fixes for building and packaging ffmpeg-min AAR ready to be imported to our projects.

## 🔨 Building

Edit environment variables in `./build-all-architectures.sh`, make sure it's executable and run it:

```bash
# Run from the ffmpeg-kit directory
./build-all-architectures.sh
```

**AAR Output Location:**
```
prebuilt/bundle-android-aar/ffmpeg-kit/ffmpeg-kit.aar
```

### 🚀 **Using the Built AAR**
1. **Run the build:**
   ```bash
   ./build-all-architectures.sh
   ```

2. **Copy to your project:**
   ```bash
   cp prebuilt/bundle-android-aar/ffmpeg-kit/ffmpeg-kit.aar /path/to/your/android/project/app/libs/
   ```

3. **Update build.gradle:**
   ```gradle
   dependencies {
       // Custom built AAR with x86 support
       implementation files('libs/ffmpeg-kit.aar')
       
       // Required dependency for FFmpeg-kit
       implementation 'com.arthenica:smart-exception-java:0.2.1'
   }
   ```

   **Note:** The smart-exception dependency is required because local AAR files don't automatically resolve transitive dependencies.
