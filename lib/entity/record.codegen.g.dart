// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      message: json['message'] as String,
      hashTag: json['hashTag'] as String,
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'message': instance.message,
      'hashTag': instance.hashTag,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
    };
