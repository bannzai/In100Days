// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitter_tweet_api_response.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TwitterTweetAPIResponse _$TwitterTweetAPIResponseFromJson(
        Map<String, dynamic> json) =>
    TwitterTweetAPIResponse(
      tweet: Tweet.fromJson(json['tweet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TwitterTweetAPIResponseToJson(
        TwitterTweetAPIResponse instance) =>
    <String, dynamic>{
      'tweet': instance.tweet.toJson(),
    };

_$_TwitterTweetAPIResponse _$$_TwitterTweetAPIResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TwitterTweetAPIResponse(
      tweet: Tweet.fromJson(json['tweet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TwitterTweetAPIResponseToJson(
        _$_TwitterTweetAPIResponse instance) =>
    <String, dynamic>{
      'tweet': instance.tweet,
    };
