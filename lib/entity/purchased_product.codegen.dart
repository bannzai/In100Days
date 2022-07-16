import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_100_days/entity/timestam_converter.dart';
import 'package:purchases_flutter/object_wrappers.dart';

part 'purchased_product.codegen.freezed.dart';
part 'purchased_product.codegen.g.dart';

@freezed
class PurchasedProduct with _$PurchasedProduct {
  @JsonSerializable(explicitToJson: true)
  factory PurchasedProduct({
    required Product product,
    @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp,
    )
        required DateTime purchasedDateTime,
  }) = _PurchasedProduct;
  PurchasedProduct._();

  factory PurchasedProduct.fromJson(Map<String, dynamic> json) =>
      _$PurchasedProductFromJson(json);
}
