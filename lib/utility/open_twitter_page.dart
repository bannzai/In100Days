import 'package:url_launcher/url_launcher.dart';

Future<bool> openTwitterUser(String twitterID) async {
  return launchUrl(Uri.parse(Uri.encodeFull("https://twitter.com/$twitterID")));
}

Future<bool> openTwitterHashTag(String hashTag) async {
  final keyword = hashTag.replaceFirst("#", "");
  return launchUrl(
      Uri.parse(Uri.encodeFull("https://twitter.com/hashtag/$keyword")));
}
