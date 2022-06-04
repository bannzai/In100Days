import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';

abstract class SecuretStorageKeys {
  static const String twitterAuthToken = 'twitterAuthToken';
  static const String twitterAuthTokenSecret = 'twitterAuthTokenSecret';
}

final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());
