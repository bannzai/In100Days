
.PHONY: secret
secret:
	echo $(FILE_FIREBASE_IOS) | base64 -D > ios/Runner/Firebase/GoogleService-Info.plist
	echo $(FILE_FIREBASE_ANDROID) | base64 -D > android/app/src/google-services.json
	./scripts/secret.sh

