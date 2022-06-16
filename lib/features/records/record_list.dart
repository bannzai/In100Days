import 'package:flutter/material.dart';
import 'package:in_100_days/features/records/records_header.dart';
import 'package:in_100_days/features/records/state.codegen.dart';

class RecordList extends StatelessWidget {
  final RecordsState state;

  const RecordList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      RecordsHeader(state: state),
      ...state.records.map((record) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: [
              Image.network(state.user.twitterAPIProfileImageURL),
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
