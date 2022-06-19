import 'package:flutter/material.dart';
import 'package:in_100_days/features/records/state.codegen.dart';
import 'package:in_100_days/style/color.dart';

class RecordList extends StatelessWidget {
  final RecordsState state;

  const RecordList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [
        ...state.records.map((record) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(state.user.orignalProfileImageURL),
                    backgroundColor: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(state.user.name,
                            style: const TextStyle(
                                color: AppColor.textMain,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(width: 5),
                        Text("@" + state.user.twitterID,
                            style: const TextStyle(
                                color: AppColor.textMain,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(width: 5),
                        Text("@" + Dateformat record.createdDateTime,
                            style: const TextStyle(
                                color: AppColor.textMain,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Text(record.message),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ]),
    );
  }
}
