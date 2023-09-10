project="flutter_native"

opencv_version="4.6.0"

projectPath="../../$project"
opencvIOSPath="$projectPath/ios"
opencvIncludePath="$projectPath"
opencvJNIPath="$projectPath/android/src/main/jniLibs/"

mkdir -p download
cd download

wget -O "opencv-$opencv_version-android-sdk.zip" "https://github.com/opencv/opencv/releases/download/$opencv_version/opencv-$opencv_version-android-sdk.zip"
wget -O "opencv-$opencv_version-ios-framework.zip" "https://github.com/opencv/opencv/releases/download/$opencv_version/opencv-$opencv_version-ios-framework.zip"
unzip "opencv-$opencv_version-android-sdk.zip"
unzip "opencv-$opencv_version-ios-framework.zip"

# remove opencv from ios project
rm -R "$opencvIOSPath/opencv2.framework"

# remove opencv from android project
rm -R "$opencvIncludePath/include"
rm -R "$opencvJNIPath"

# copy opencv to ios project
cp -R opencv2.framework "$opencvIOSPath"

# print success message for ios
echo "OpenCV $opencv_version for iOS has been successfully installed"

# copy opencv to android project
cp -R OpenCV-android-sdk/sdk/native/jni/include "$opencvIncludePath"
mkdir -p "$opencvJNIPath"
cp -R OpenCV-android-sdk/sdk/native/libs/* "$opencvJNIPath"

# print success message for android
echo "OpenCV $opencv_version for Android has been successfully installed"

rm -R ../download