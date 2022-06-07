import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/provider/auth.dart';

import '../entity/tweet.codegen.dart';

final tweetsStreamProvider = StreamProvider<List<TweetSearch>>((ref) {
  final authInfo = ref.watch(authInfoProvider);
  return FirebaseFirestore.instance
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
