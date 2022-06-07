import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import '../entity/goal.codegen.dart';

String _collectionPathBuilder({required String userID}) {
  return "/users/$userID/goals";
}

String _documentPathBuilder({required String userID, required String goalID}) {
  return "/users/$userID/goals/$goalID";
}

FromFirestore<Goal> _fromFirestore() =>
    (snapshot, _) => Goal.fromJson(snapshot.data()!);
ToFirestore<Goal> _toFirestore() => (value, _) => value.toJson();

CollectionReference<Goal> goalCollectionReference({required String userID}) =>
    FirebaseFirestore.instance
        .collection(_collectionPathBuilder(userID: userID))
        .withConverter(
          fromFirestore: _fromFirestore(),
          toFirestore: _toFirestore(),
        );

final goalsStreamProvider = StreamProvider((ref) {
  final collectionReference =
      goalCollectionReference(userID: FirebaseAuth.instance.currentUser!.uid);
  return collectionReference
      .snapshots()
      .map((event) => event.docs.map((e) => e.data()).toList());
});