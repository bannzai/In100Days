import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/components/user_info.dart';
import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/features/congratulation/conguratulation_page.dart';
import 'package:in_100_days/features/game_over/game_over_page.dart';
import 'package:in_100_days/features/purchase/purchase_complete.dart';
import 'package:in_100_days/features/purchase/purchase_sheet.dart';
import 'package:in_100_days/features/records/state.codegen.dart';
import 'package:in_100_days/style/button.dart';
import 'package:in_100_days/style/color.dart';
import 'package:in_100_days/features/records/utility.dart';
import 'package:in_100_days/utility/open_twitter_page.dart';
import 'package:url_launcher/url_launcher.dart';

class RecordList extends HookWidget {
  final RecordsState state;

  const RecordList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goalDate =
        state.goal.createdDateTime.add(const Duration(days: 100 - 1));
    final gameOverIsShown = useState(false);
    final _isGameOver = isGameOver(state.records);
    final _purchasedInToday = purchasedInToday(state.goal);
    final congratulationIsShown = useState(false);
    final _isCongratulation = isCongratulation(state.goal);

    useEffect(() {
      if (_isGameOver) {
        if (!_purchasedInToday) {
          if (!gameOverIsShown.value) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).push(
                  GameOverPageRoute.route(goal: state.goal, user: state.user));
              gameOverIsShown.value = true;
            });
          }
        }
      } else {
        if (_isCongratulation) {
          if (!congratulationIsShown.value) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).push(CongratulationPageRoute.route(
                  user: state.user, goal: state.goal));
              congratulationIsShown.value = true;
            });
          }
        }
      }
      return null;
    }, [
      _isGameOver,
      _purchasedInToday,
      gameOverIsShown.value,
      _isCongratulation,
      congratulationIsShown.value
    ]);

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 10),
              UserInfo(
                user: state.user,
                fullHashTag: state.goal.fullHashTag,
              ),
              const SizedBox(height: 20),
              ...state.records.asMap().entries.map((entry) {
                final index = entry.key;
                final record = state.records[index];
                final dateNumber = (100 - 1) -
                    goalDate.difference(record.createdDateTime).inDays;
                return _element(context,
                    record: record, dateNumber: dateNumber, index: index);
              }),
            ],
          ),
        ),
        if (_isGameOver && !_purchasedInToday)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: PrimaryButton(
                onPressed: () async => showPurchaseSheet(context,
                        goal: state.goal,
                        userID: state.user.id!, onPurchased: (product) {
                      Navigator.of(context).push(
                          PurchaseCompletePageRoute.route(
                              product: product,
                              goal: state.goal,
                              user: state.user));
                    }),
                text: "本気で再開する"),
          ),
      ],
    );
  }

  Widget _element(BuildContext context,
      {required Record record, required int dateNumber, required int index}) {
    // FIXME: Prevent manual calculation for message area width
    const avatarRadius = 30.0;
    const avatarBorderWidth = 0.5;
    const horizonalPadding = 14.0;
    const spacingAvatarBetweenMessageArea = 10.0;
    return Column(
      children: [
        if (index == 0) const Divider(color: Colors.grey),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: horizonalPadding),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  child: CircleAvatar(
                    radius: avatarRadius,
                    backgroundImage:
                        NetworkImage(state.user.orignalProfileImageURL),
                    backgroundColor: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: avatarBorderWidth,
                    ),
                  ),
                ),
                onTap: () {
                  openTwitterUser(state.user.twitterID);
                },
              ),
              const SizedBox(width: spacingAvatarBetweenMessageArea),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        (avatarRadius * 2 + avatarBorderWidth * 2) -
                        spacingAvatarBetweenMessageArea -
                        (horizonalPadding * 2),
                    child: RichText(
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openTwitterHashTag(record.hashTag);
                              },
                            style: const TextStyle(
                              color: AppColor.twitterHashTag,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
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
