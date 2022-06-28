// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Goal _$$_GoalFromJson(Map<String, dynamic> json) => _$_Goal(
      id: json['id'] as String?,
      goalAction: json['goalAction'] as String,
      fullHashTag: json['fullHashTag'] as String,
      createdDateTime: NonNullTimestampConverter.timestampToDateTime(
          json['createdDateTime'] as Timestamp),
    );

Map<String, dynamic> _$$_GoalToJson(_$_Goal instance) => <String, dynamic>{
      'id': instance.id,
      'goalAction': instance.goalAction,
      'fullHashTag': instance.fullHashTag,
      'createdDateTime': NonNullTimestampConverter.dateTimeToTimestamp(
          instance.createdDateTime),
    };
