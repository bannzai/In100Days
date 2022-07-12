import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/provider/auth.dart';

import '../entity/user.codegen.dart';

DocumentReference<User> userDocumentReference({required String userID}) {
  return FirebaseFirestore.instance.doc("/users/$userID").withConverter(
        fromFirestore: (snapshot, _) =>
            User.fromJson(snapshot.data()!)..copyWith(id: snapshot.id),
        toFirestore: (User value, _) {
          return value.toJson();
        },
      );
}

DocumentReference userDocumentPrivateReference({required String userID}) {
  return FirebaseFirestore.instance.doc("/users/$userID/privates/$userID");
}

final userStreamProvider = StreamProvider<User?>((ref) {
  final firebaseCurrentUser = ref.watch(firebaseCurrentUserProvider);
  if (firebaseCurrentUser is AsyncLoading) {
    return const Stream.empty();
  }

  final twitterAuthTokenSecretValue = firebaseCurrentUser.asData?.value;
  if (twitterAuthTokenSecretValue == null) {
    return Stream.value(null);
  }

  return userDocumentReference(userID: twitterAuthTokenSecretValue.uid)
      .snapshots()
      .map((event) => event.data());
});
