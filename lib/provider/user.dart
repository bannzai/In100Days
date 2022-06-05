import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/firestore.dart';

import '../entity/user.codegen.dart';

final userDocumentReferenceProvider = Provider.family(
  (ref, String userID) =>
      ref.watch(firestoreProvider).doc("/users/$userID").withConverter(
            fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
            toFirestore: (User value, _) {
              return value.toJson();
            },
          ),
);

final userStramProvider = StreamProvider<User>((ref) {
  final authInfo = ref.watch(authInfoProvider);

  return ref
      .watch(userDocumentReferenceProvider(authInfo.value!.firebaseUserID))
      .snapshots()
      .map((event) => event.data()!);
});
