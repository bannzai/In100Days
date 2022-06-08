import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/features/record_add/record_add_sheet.dart';
import 'package:in_100_days/style/color.dart';

class RecordListEmpty extends HookConsumerWidget {
  final User user;
  final Goal goal;
  const RecordListEmpty({
    Key? key,
    required this.user,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(child: RecordListEmptyButton(goal: goal, user: user));
  }
}

class RecordListEmptyButton extends StatelessWidget {
  final User user;
  final Goal goal;
  const RecordListEmptyButton({
    Key? key,
    required this.user,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (_) {
              RecordAddSheet(user: user, goal: goal);
            });
      },
      child: Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(
          color: AppColor.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
