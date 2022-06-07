// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Step _$$_StepFromJson(Map<String, dynamic> json) => _$_Step(
      stepAction: json['stepAction'] as String,
      fullHashTag: json['fullHashTag'] as String,
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
    );

Map<String, dynamic> _$$_StepToJson(_$_Step instance) => <String, dynamic>{
      'stepAction': instance.stepAction,
      'fullHashTag': instance.fullHashTag,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
    };
