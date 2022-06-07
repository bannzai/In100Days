// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      recordAction: json['recordAction'] as String,
      fullHashTag: json['fullHashTag'] as String,
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'recordAction': instance.recordAction,
      'fullHashTag': instance.fullHashTag,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
    };
