Automatically set build number in Xcode
======================

Each time you build your project, CFBundleVersion is updated with repository revision number.

1. Create new aggregate target in the project and add "Run Script" build phase: `/bin/sh Version.sh "${PROJECT_DIR}/Version.h"`
2. Modify build settings of main target:  
	2.1 Preprocess Info.plist file => YES  
	2.2 Info.plist Preprocessor Prefix File => Version.h  
3. Set `CFBundleVersion` in Info.plist to `BUILD_NUMBER`
4. Add aggregate target as a dependency of main target, so that `Version.h` file is generated before Info.plist is preprocessed.
5. It might also be useful to add `Version.h` to version control ignore list.