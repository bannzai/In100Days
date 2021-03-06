import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_100_days/entity/purchased_product.codegen.dart';
import 'package:in_100_days/entity/timestam_converter.dart';

part 'goal.codegen.freezed.dart';
part 'goal.codegen.g.dart';

@freezed
class Goal with _$Goal {
  @JsonSerializable(explicitToJson: true)
  factory Goal({
    String? id,
    required String goalAction,
    required String hashTag,
    @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp,
    )
        required DateTime createdDateTime,
    required List<PurchasedProduct> purchasedProducts,
  }) = _Goal;
  Goal._();

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

  String get fullHashTag => "#" + hashTag;
}
