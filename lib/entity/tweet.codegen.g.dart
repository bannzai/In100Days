// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetSearch _$TweetSearchFromJson(Map<String, dynamic> json) => TweetSearch(
      response: json['response'],
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
    );

Map<String, dynamic> _$TweetSearchToJson(TweetSearch instance) =>
    <String, dynamic>{
      'response': instance.response,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
    };

_$_TweetSearch _$$_TweetSearchFromJson(Map<String, dynamic> json) =>
    _$_TweetSearch(
      response: json['response'],
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
    );

Map<String, dynamic> _$$_TweetSearchToJson(_$_TweetSearch instance) =>
    <String, dynamic>{
      'response': instance.response,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
    };
