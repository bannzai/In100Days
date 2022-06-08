import 'package:flutter/material.dart';
import 'package:in_100_days/features/record_add/record_add_sheet.dart';
import 'package:in_100_days/features/records/state.codegen.dart';
import 'package:in_100_days/style/color.dart';

class RecordListEmpty extends StatelessWidget {
  final RecordsState state;
  const RecordListEmpty({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => RecordAddSheet(user: state.user, goal: state.goal),
          );
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
      ),
    );
  }
}
