import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_100_days/entity/twitter_tweet_api_response.codegen.dart';

part 'tweet.codegen.freezed.dart';
part 'tweet.codegen.g.dart';

@freezed
class TweetSearch with _$TweetSearch {
  @JsonSerializable(explicitToJson: true)
  factory TweetSearch({
    required TwitterTweetAPIResponse response,
    required DateTime createdDateTime,
  }) = _TweetSearch;

  factory TweetSearch.fromJson(Map<String, dynamic> json) =>
      _$TweetSearchFromJson(json);
}
