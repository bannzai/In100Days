import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/user/user_delete_row.dart';
import 'package:in_100_days/provider/user.dart';
import 'package:in_100_days/style/color.dart';
import 'package:url_launcher/url_launcher.dart';

class UserPage extends HookConsumerWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStreamProvider).value!;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("ユーザーページ"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                backgroundImage: NetworkImage(user.profileImageURL),
                backgroundColor: Colors.black,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  launchUrl(
                      Uri.parse("https://twitter.com/${user.screenName}"));
                },
                child: Text(user.screenName,
                    style: const TextStyle(fontSize: 14, color: AppColor.link)),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: const [
                    Divider(color: Colors.black38),
                    UserDeleteRow(),
                    Divider(color: Colors.black38, indent: 16),
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

extension UserPageRoute on UserPage {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "UserPage"),
      builder: (_) => const UserPage(),
    );
  }
}
