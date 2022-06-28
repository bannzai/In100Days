import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import '../entity/record.codegen.dart';

String _collectionPathBuilder(
    {required String userID, required String goalID}) {
  return "/users/$userID/goals/$goalID/records";
}

FromFirestore<Record> _fromFirestore() =>
    (snapshot, _) => Record.fromJson(snapshot.data()!);
ToFirestore<Record> _toFirestore() => (value, _) => value.toJson();

CollectionReference<Record> recordCollectionReference(
        {required String userID, required String goalID}) =>
    FirebaseFirestore.instance
        .collection(_collectionPathBuilder(userID: userID, goalID: goalID))
        .withConverter(
          fromFirestore: _fromFirestore(),
          toFirestore: _toFirestore(),
        );

final recordsStreamProvider = StreamProvider.family((ref, String goalID) =>
    recordCollectionReference(
            userID: FirebaseAuth.instance.currentUser!.uid, goalID: goalID)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList()));
