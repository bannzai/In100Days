import 'package:url_launcher/url_launcher.dart';

Future<bool> openTwitterHashTag(String hashTag) async {
  final keyword = hashTag.replaceFirst("#", "");
  return launchUrl(
      Uri.parse(Uri.encodeFull("https://twitter.com/hashtag/$keyword")));
}
