
.PHONY: secret
secret:
	echo $(FILE_FIREBASE_ANDROID_DEV) | base64 --decode > android/app/src/dev/google-services.json
	echo $(FILE_FIREBASE_ANDROID_PROD) | base64 --decode > android/app/src/prod/google-services.json
	echo $(FILE_IOS_FIREBASE_APP_ID_FILE) | base64 --decode > ios/firebase_app_id_file.json
	echo $(FILE_FIREBASE_OPTION) | base64 --decode > lib/firebase_options.dart
	./scripts/secret.sh
	./android/scripts/key_properties.sh

