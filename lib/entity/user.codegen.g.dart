// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      twitterUserID: json['twitterUserID'] as String,
      name: json['name'] as String,
      screenName: json['screenName'] as String,
      twitterAPIProfileImageURL: json['twitterAPIProfileImageURL'] as String,
      orignalProfileImageURL: json['orignalProfileImageURL'] as String,
      createdDateTime: NonNullTimestampConverter.timestampToDateTime(
          json['createdDateTime'] as Timestamp),
      colorString: json['colorString'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'twitterUserID': instance.twitterUserID,
      'name': instance.name,
      'screenName': instance.screenName,
      'twitterAPIProfileImageURL': instance.twitterAPIProfileImageURL,
      'orignalProfileImageURL': instance.orignalProfileImageURL,
      'createdDateTime': NonNullTimestampConverter.dateTimeToTimestamp(
          instance.createdDateTime),
      'colorString': instance.colorString,
    };
