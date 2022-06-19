const lineBreakCountForBuilTweetHashTag = 1;
String buildTweetWithHashTag(
    {required String message, required String fullHashTag}) {
  var tweet = message;
  for (var i = 0; i < lineBreakCountForBuilTweetHashTag; i++) {
    tweet += '\n';
  }
  tweet += fullHashTag;
  return tweet;
}
