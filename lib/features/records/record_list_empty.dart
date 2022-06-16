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
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text("初めての記録をしましょう",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) =>
                        RecordAddSheet(user: state.user, goal: state.goal),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: AppColor.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
