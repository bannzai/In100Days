import 'package:url_launcher/url_launcher.dart';

Future<bool> openTwitterHashTag(String hashTag) async {
  return launchUrl(
      Uri.parse("https://twitter.com/search?q=#$hashTag&src=typed_query"));
}
