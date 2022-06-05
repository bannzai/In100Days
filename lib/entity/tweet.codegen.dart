import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet.codegen.freezed.dart';

@freezed
class Tweet with _$Tweet {
  factory Tweet({
    required TweetTwitterAPIResponse response,
  }) = _Tweet;
  Tweet._();
}

@freezed
class TweetTwitterAPIResponse with _$TweetTwitterAPIResponse {
  factory TweetTwitterAPIResponse({
    required User user,
    required PremiumAndTrial premiumAndTrial,
  }) = _TweetTwitterAPIResponse;
  TweetTwitterAPIResponse._();
}
