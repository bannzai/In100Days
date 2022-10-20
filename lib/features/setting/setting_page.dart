import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/setting/user_delete_row.dart';
import 'package:in_100_days/provider/user.dart';
import 'package:in_100_days/style/color.dart';
import 'package:in_100_days/utility/open_twitter_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/auth.dart';
import '../error/error_alert.dart';
import '../sign_in/state_notifier.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStreamProvider).value;
    final stateNotifier = ref.watch(loginStateNotifierProvider.notifier);

    if (user == null) {
      // Deleted User
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("設定"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  openTwitterUser(user.twitterID);
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.orignalProfileImageURL),
                  backgroundColor: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  openTwitterUser(user.twitterID);
                },
                child: Text(user.twitterID,
                    style: const TextStyle(fontSize: 14, color: AppColor.link)),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    const Divider(color: Colors.black38),
                    const UserDeleteRow(),
                    const Divider(color: Colors.black38, indent: 16),
                    ListTile(
                      title: Row(children: const [
                        Text(
                          "利用規約",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                        SizedBox(width: 8),
                      ]),
                      onTap: () {
                        launchUrl(Uri.parse(
                            "https://bannzai.github.io/In100Days/Terms"));
                      },
                    ),
                    const Divider(color: Colors.black38, indent: 16),
                    ListTile(
                      title: Row(children: const [
                        Text(
                          "プライバシーポリシー",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                        SizedBox(width: 8),
                      ]),
                      onTap: () {
                        launchUrl(Uri.parse(
                            "https://bannzai.github.io/In100Days/PrivacyPolicy"));
                      },
                    ),
                    const Divider(color: Colors.black38, indent: 16),
                    ListTile(
                      title: Row(children: const [
                        Text(
                          "Twitter情報再取得",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                        SizedBox(width: 8),
                      ]),
                      onTap: () async {
                        try {
                          final updatedUser = await stateNotifier.asyncAction.updateTwitterUser(user);
                          final setUser = ref.read(setUserProvider);
                          await setUser(updatedUser);

                          ref.refresh(firebaseCurrentUserProvider);
                        } catch (error) {
                          showErrorAlert(context, error: error);
                        }
                      },
                    ),
                    const Divider(color: Colors.black38),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension UserPageRoute on SettingPage {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "UserPage"),
      builder: (_) => const SettingPage(),
    );
  }
}
