import 'package:flutter/material.dart';
import 'package:in_100_days/components/user_info.dart';
import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/features/records/state.codegen.dart';
import 'package:in_100_days/style/color.dart';
import 'package:url_launcher/url_launcher.dart';

class RecordList extends StatelessWidget {
  final RecordsState state;

  const RecordList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goalDate =
        state.goal.createdDateTime.add(const Duration(days: 100 - 1));

    return ListView(
      children: [
        const SizedBox(height: 10),
        UserInfo(
          user: state.user,
          hashTag: state.goal.fullHashTag,
        ),
        const SizedBox(height: 20),
        ...state.records.asMap().entries.map((entry) {
          final index = entry.key;
          final record = state.records[index];
          final dateNumber =
              (100 - 1) - goalDate.difference(record.createdDateTime).inDays;
          return _element(context,
              record: record, dateNumber: dateNumber, index: index);
        }),
      ],
    );
  }

  Widget _element(BuildContext context,
      {required Record record, required int dateNumber, required int index}) {
    return Column(
      children: [
        if (index == 0) const Divider(color: Colors.grey),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                          Text("$dateNumber日目",
                              style: const TextStyle(
                                  color: AppColor.textNote,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      // FIXME: Can not use Spacer
                      const SizedBox(width: 10),
                      GestureDetector(
                          onTap: () {
                            final url =
                                "https://twitter.com/${state.user.twitterID}/status/${record.tweetID}";
                            launchUrl(Uri.parse(url));
                          },
                          child: const Icon(Icons.open_in_new, size: 20)),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: record.message + "\n\n",
                          style: const TextStyle(
                            color: AppColor.textMain,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: record.hashTag,
                          style: const TextStyle(
                            color: AppColor.twitterHashTag,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
