import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/provider/auth.dart';

import '../entity/user.codegen.dart';

final userDocumentReferenceProvider = Provider.family(
  (ref, String userID) =>
      FirebaseFirestore.instance.doc("/users/$userID").withConverter(
            fromFirestore: (snapshot, _) =>
                User.fromJson(snapshot.data()!)..copyWith(id: snapshot.id),
            toFirestore: (User value, _) {
              return value.toJson();
            },
          ),
);

final userStreamProvider = StreamProvider<User?>((ref) {
  final authInfo = ref.watch(authInfoProvider);
  if (authInfo is AsyncLoading) {
    return const Stream.empty();
  }

  final authInfoValue = authInfo.value;
  if (authInfoValue == null) {
    return Stream.value(null);
  }

  return ref
      .watch(userDocumentReferenceProvider(authInfoValue.firebaseUserID))
      .snapshots()
      .map((event) => event.data()!);
});
