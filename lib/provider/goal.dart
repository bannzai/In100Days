import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import '../entity/goal.codegen.dart';

String _collectionPathBuilder({required String userID}) {
  return "/users/$userID/goals";
}

FromFirestore<Goal> _fromFirestore() =>
    (snapshot, _) => Goal.fromJson(snapshot.data()!).copyWith(id: snapshot.id);
ToFirestore<Goal> _toFirestore() => (value, _) => value.toJson();

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
