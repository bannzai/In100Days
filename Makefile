
.PHONY: secret
secret:
	echo $(FILE_FIREBASE_IOS) | base64 -D > ios/Firebase/GoogleService-Info.plist
	./scripts/secret.sh

