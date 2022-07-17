// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      tweetID: json['tweetID'] as String,
      message: json['message'] as String,
      hashTag: json['hashTag'] as String,
      createdDateTime: NonNullTimestampConverter.timestampToDateTime(
          json['createdDateTime'] as Timestamp),
      isConguratulation: json['isConguratulation'] as bool? ?? false,
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'tweetID': instance.tweetID,
      'message': instance.message,
      'hashTag': instance.hashTag,
      'createdDateTime': NonNullTimestampConverter.dateTimeToTimestamp(
          instance.createdDateTime),
      'isConguratulation': instance.isConguratulation,
    };
