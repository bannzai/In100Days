import 'package:dart_twitter_api/twitter_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet.codegen.freezed.dart';

@freezed
class AppTweetSearch with _$AppTweetSearch {
  factory AppTweetSearch({
    required TweetTwitterAPIResponse response,
    required DateTime createdDateTime,
  }) = _AppTweetSearch;
  AppTweetSearch._();
}

@freezed
class TweetTwitterAPIResponse with _$TweetTwitterAPIResponse {
  factory TweetTwitterAPIResponse({
    required Tweet tweet,
  }) = _TweetTwitterAPIResponse;
  TweetTwitterAPIResponse._();
}
