import 'package:oauth1/oauth1.dart';
import 'package:riverpod/riverpod.dart';

final tweetsProvider = Provider.family((ref, Client client) async {
  return ref.read(authInfoProvider).when(
        data: (authInfo) {
          if (authInfo != null) {
            return authInfo.twitterAuthToken;
          } else {
            return null;
          }
        },
        error: (error, st) => null,
        loading: () => null,
      );
});
