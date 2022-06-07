import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import '../entity/step.codegen.dart';

String _collectionPathBuilder(
    {required String userID, required String goalID}) {
  return "/users/$userID/goals/$goalID/steps";
}

FromFirestore<Step> _fromFirestore() =>
    (snapshot, _) => Step.fromJson(snapshot.data()!);
ToFirestore<Step> _toFirestore() => (value, _) => value.toJson();

CollectionReference<Step> stepCollectionReference(
        {required String userID, required String goalID}) =>
    FirebaseFirestore.instance
        .collection(_collectionPathBuilder(userID: userID, goalID: goalID))
        .withConverter(
          fromFirestore: _fromFirestore(),
          toFirestore: _toFirestore(),
        );

final stepsStreamProvider = StreamProvider.family((ref, String goalID) =>
    stepCollectionReference(
            userID: FirebaseAuth.instance.currentUser!.uid, goalID: goalID)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList()));
