import 'package:flutter/material.dart';
import 'package:in_100_days/features/records/state.codegen.dart';
import 'package:in_100_days/style/color.dart';
import 'package:intl/intl.dart';

class RecordList extends StatelessWidget {
  final RecordsState state;

  const RecordList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goalDate =
        state.goal.createdDateTime.add(const Duration(days: 100 - 1));

    return Expanded(
      child: ListView(children: [
        ...state.records.map((record) {
          final recordNumber =
              100 - goalDate.difference(record.createdDateTime).inDays;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(state.user.name,
                            style: const TextStyle(
                                color: AppColor.textMain,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(width: 5),
                        Text("@" + state.user.twitterID,
                            style: const TextStyle(
                                color: AppColor.textNote,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(width: 5),
                        Text("$recordNumber日目",
                            style: const TextStyle(
                                color: AppColor.textNote,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: record.message + "\n",
                            style: const TextStyle(
                              color: AppColor.textMain,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: record.hashTag,
                            style: const TextStyle(
                              color: AppColor.twitterHashTag,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
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
