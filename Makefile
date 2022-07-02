
.PHONY: secret
secret:
	echo $(FILE_FIREBASE_ANDROID_DEV) | base64 -D > android/app/src/dev/google-services.json
	echo $(FILE_FIREBASE_ANDROID_PROD) | base64 -D > android/app/src/prod/google-services.json
	echo $(FILE_IOS_FIREBASE_APP_ID_FILE) | base64 -D > ios/firebase_app_id_file.json
	echo $(FILE_FIREBASE_OPTION) | base64 -D > lib/firebase_options.dart
	./scripts/secret.sh
	./android/scripts/key_properties.sh

