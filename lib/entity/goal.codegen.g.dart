// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Goal _$$_GoalFromJson(Map<String, dynamic> json) => _$_Goal(
      goalAction: json['goalAction'] as String,
      fullHashTag: json['fullHashTag'] as String,
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
    );

Map<String, dynamic> _$$_GoalToJson(_$_Goal instance) => <String, dynamic>{
      'goalAction': instance.goalAction,
      'fullHashTag': instance.fullHashTag,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
    };
