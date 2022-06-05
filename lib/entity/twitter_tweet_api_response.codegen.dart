import 'package:dart_twitter_api/twitter_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'twitter_tweet_api_response.codegen.freezed.dart';
part 'twitter_tweet_api_response.codegen.g.dart';

@freezed
class TwitterTweetAPIResponse with _$TwitterTweetAPIResponse {
  @JsonSerializable(explicitToJson: true)
  factory TwitterTweetAPIResponse({
    required Tweet tweet,
  }) = _TwitterTweetAPIResponse;

  factory TwitterTweetAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$TwitterTweetAPIResponseFromJson(json);
}
