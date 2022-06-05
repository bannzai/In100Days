import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/firestore.dart';

import '../entity/tweet.codegen.dart';

final tweetsStreamProvider = StreamProvider<List<TweetSearch>>((ref) {
  final authInfo = ref.watch(authInfoProvider);
  final firestore = ref.watch(firestoreProvider);
  return firestore
      .collection("/users/${authInfo.value!.firebaseUserID}/searchTweets")
      .withConverter(
          fromFirestore: (snapshot, _) =>
              TweetSearch.fromJson(snapshot.data()!),
          toFirestore: (TweetSearch value, _) {
            return value.toJson();
          })
      .snapshots()
      .map((event) => event.docs.map((doc) => doc.data()).toList());
});
