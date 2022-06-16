import 'package:flutter/material.dart';
import 'package:in_100_days/features/records/state.codegen.dart';

class RecordsHeader extends StatelessWidget {
  final RecordsState state;

  const RecordsHeader({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(state.user.twitterAPIProfileImageURL),
          backgroundColor: Colors.black,
        ),
        const SizedBox(height: 20),
        Text(state.goal.goalAction),
        Text(state.goal.fullHashTag),
        Text("作成日: ${state.goal.createdDateTime}"),
      ],
    );
  }
}
