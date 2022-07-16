import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import '../entity/goal.codegen.dart';

String _documentPathBuilder({required String userID, required String goalID}) {
  return "/users/$userID/goals/$goalID";
}

String _collectionPathBuilder({required String userID}) {
  return "/users/$userID/goals";
}

FromFirestore<Goal> _fromFirestore() =>
    (snapshot, _) => Goal.fromJson(snapshot.data()!).copyWith(id: snapshot.id);
ToFirestore<Goal> _toFirestore() => (value, _) => value.toJson();

class SetGoal {
  Future<void> call(Goal goal, {required String userID}) async {
    await goalDocumentReference(goalID: goal.id!, userID: userID)
        .set(goal, SetOptions(merge: true));
  }
}

final setGoalProvider = Provider((ref) => SetGoal());

DocumentReference<Goal> goalDocumentReference({
  required String userID,
  required String goalID,
}) =>
    FirebaseFirestore.instance
        .doc(_documentPathBuilder(userID: userID, goalID: goalID))
        .withConverter(
          fromFirestore: _fromFirestore(),
          toFirestore: _toFirestore(),
        );
CollectionReference<Goal> goalCollectionReference({required String userID}) =>
    FirebaseFirestore.instance
        .collection(_collectionPathBuilder(userID: userID))
        .withConverter(
          fromFirestore: _fromFirestore(),
          toFirestore: _toFirestore(),
        );

final goalsStreamProvider = StreamProvider((ref) =>
    goalCollectionReference(userID: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList()));
