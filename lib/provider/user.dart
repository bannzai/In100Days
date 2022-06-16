import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  final firebaseCurrentUser = ref.watch(firebaseCurrentUserProvider);
  if (firebaseCurrentUser is AsyncLoading) {
    return const Stream.empty();
  }

  final twitterAuthTokenSecretValue = firebaseCurrentUser.asData?.value;
  if (twitterAuthTokenSecretValue == null) {
    return Stream.value(null);
  }

  return ref
      .watch(userDocumentReferenceProvider(twitterAuthTokenSecretValue.uid))
      .snapshots()
      .map((event) => event.data());
});

final userColorProvider = Provider<Color?>((ref) {
  final user = ref.watch(userStreamProvider);
  if (user is AsyncLoading) {
    return null;
  }
  final colorString = user.asData?.value?.colorString;
  if (colorString == null) {
    return null;
  }

  try {
    String valueString = colorString.split('(0x')[1].split(')')[0];
    int colorValue = int.parse(valueString, radix: 16);
    return Color(colorValue);
  } catch (_) {
    return null;
  }
});
