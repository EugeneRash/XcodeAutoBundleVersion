Automatically update build number in Xcode
======================

Each time you build your project, CFBundleVersion is updated with repository revision number based on App Version (CFBundleShortVersionString)

1. Copy `Version.sh` script to your project dir
1. Create new aggregate target in the project and add "Run Script" build phase: `/bin/sh "${PROJECT_DIR}/Version.sh" "${PROJECT_DIR}/Version.h" "${PROJECT_NAME}"`
2. Modify build settings of main target:  
	3.1 `Preprocess Info.plist File` => `YES`  
	3.2 `Info.plist Preprocessor Prefix File` => `Version.h `
3. Set `CFBundleVersion` in Info.plist to `BUILD_NUMBER`
4. Add aggregate target as a dependency of main target, so that `Version.h` file is generated before Info.plist is preprocessed.
5. Add `Version.h` to version control ignore list.