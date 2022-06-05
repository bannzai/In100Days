// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TweetSearch _$$_TweetSearchFromJson(Map<String, dynamic> json) =>
    _$_TweetSearch(
      response: TwitterTweetAPIResponse.fromJson(
          json['response'] as Map<String, dynamic>),
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
    );

Map<String, dynamic> _$$_TweetSearchToJson(_$_TweetSearch instance) =>
    <String, dynamic>{
      'response': instance.response.toJson(),
      'createdDateTime': instance.createdDateTime.toIso8601String(),
    };
