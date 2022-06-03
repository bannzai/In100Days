import 'package:flutter/material.dart';
import 'package:in_100_days/secret/secret.dart';
import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:twitter_login/twitter_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final controller = TextEditingController();
  final platform = oauth1.Platform(
    'https://api.twitter.com/oauth/request_token',
    'https://api.twitter.com/oauth/authorize',
    'https://api.twitter.com/oauth/access_token',
    oauth1.SignatureMethods.hmacSha1,
  );
  final clientCredentials = oauth1.ClientCredentials(
      TwitterAPISecret.apiKey, TwitterAPISecret.apiKeySecret);
  late final auth = oauth1.Authorization(clientCredentials, platform);
  oauth1.Credentials? tokenCredentials;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ログイン後に表示されたPINを入力
            TextFormField(
              controller: controller,
            ),
            ElevatedButton(
              onPressed: () async {
                final twitterLogin = TwitterLogin(
                  apiKey: TwitterAPISecret.apiKey,
                  apiSecretKey: TwitterAPISecret.apiKeySecret,
                  redirectURI: 'in100days://',
                );
                final authResult = await twitterLogin.login();

                // 取得した Access Token を使ってAPIにリクエストできる
                final client = oauth1.Client(
                  platform.signatureMethod,
                  clientCredentials,
                  oauth1.Credentials(
                    authResult.authToken!,
                    authResult.authTokenSecret!,
                  ),
                );
                final apiResponse = await client.get(
                  Uri.parse(
                      'https://api.twitter.com/1.1/statuses/home_timeline.json?count=1'),
                );
                print(apiResponse.body);
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
