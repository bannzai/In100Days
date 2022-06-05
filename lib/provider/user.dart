import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/firestore.dart';

import '../entity/user.codegen.dart';

final userDocumentReferenceProvider = Provider((ref) {
  final authInfo = ref.watch(authInfoProvider);
  final firestore = ref.watch(firestoreProvider);

  return firestore
      .doc("/users/${authInfo.value!.firebaseUserID}")
      .withConverter(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (User value, _) {
            return value.toJson();
          });
});

final userStramProvider = StreamProvider<User>((ref) =>
  ref
      .watch(userDocumentReferenceProvider)
      .snapshots()
      .map((event) => event.data()!);
);
