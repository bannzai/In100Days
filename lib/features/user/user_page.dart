import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/user_delete/user_delete_button.dart';
import 'package:in_100_days/provider/user.dart';

class UserPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStreamProvider).value!;

    return Scaffold(
      body: Column(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.profileImageURL),
          backgroundColor: Colors.black,
        ),
        
        UserDeleteButton()
      ]),
    );
  }
}
