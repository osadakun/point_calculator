clean-caches:
	flutter clean
	rm -rf ios/Pods ios/Podfile.lock
	rm -rf ~/Library/Caches/CocoaPods
	rm -rf ~/Library/Developer/Xcode/DerivedData
	flutter pub get
	cd ios
	pod install --repo-update
	cd ..
