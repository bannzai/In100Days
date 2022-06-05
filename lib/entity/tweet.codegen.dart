import 'package:dart_twitter_api/twitter_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet.codegen.freezed.dart';
part 'tweet.codegen.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class TweetSearch with _$TweetSearch {
  factory TweetSearch({
    required TwitterTweetAPIResponse response,
    required DateTime createdDateTime,
  }) = _TweetSearch;

  factory TweetSearch.fromJson(Map<String, dynamic> json) =>
      _$TweetSearchFromJson(json);
}