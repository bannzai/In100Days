// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchased_product.codegen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchasedProduct _$$_PurchasedProductFromJson(Map<String, dynamic> json) =>
    _$_PurchasedProduct(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      purchasedDateTime: NonNullTimestampConverter.timestampToDateTime(
          json['purchasedDateTime'] as Timestamp),
    );

Map<String, dynamic> _$$_PurchasedProductToJson(_$_PurchasedProduct instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'purchasedDateTime': NonNullTimestampConverter.dateTimeToTimestamp(
          instance.purchasedDateTime),
    };
