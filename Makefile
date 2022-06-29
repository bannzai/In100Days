
.PHONY: secret
secret:
	echo $(FILE_FIREBASE_IOS_DEV) | base64 -D > ios/Runner/dev/GoogleService-Info.plist
	echo $(FILE_FIREBASE_ANDROID_DEV) | base64 -D > android/app/src/dev/google-services.json
	echo $(FILE_FIREBASE_IOS_PROD) | base64 -D > ios/Runner/prod/GoogleService-Info.plist
	echo $(FILE_FIREBASE_ANDROID_PROD) | base64 -D > android/app/src/prod/google-services.json
	./scripts/secret.sh

