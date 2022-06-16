import 'package:flutter/material.dart';
import 'package:in_100_days/features/records/state.codegen.dart';

class RecordList extends StatelessWidget {
  final RecordsState state;

  const RecordList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ...state.records.map((record) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: [
              Image.network(state.user.orignalProfileImageURL),
              Column(
                children: [
                  Text(record.message),
                ],
              )
            ],
          ),
        );
      }).toList(),
    ]);
  }
}
