// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Goal _$$_GoalFromJson(Map<String, dynamic> json) => _$_Goal(
      id: json['id'] as String?,
      goalAction: json['goalAction'] as String,
      hashTag: json['hashTag'] as String,
      createdDateTime: NonNullTimestampConverter.timestampToDateTime(
          json['createdDateTime'] as Timestamp),
      purchasedProducts: (json['purchasedProducts'] as List<dynamic>)
          .map((e) => PurchasedProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GoalToJson(_$_Goal instance) => <String, dynamic>{
      'id': instance.id,
      'goalAction': instance.goalAction,
      'hashTag': instance.hashTag,
      'createdDateTime': NonNullTimestampConverter.dateTimeToTimestamp(
          instance.createdDateTime),
      'purchasedProducts':
          instance.purchasedProducts.map((e) => e.toJson()).toList(),
    };
