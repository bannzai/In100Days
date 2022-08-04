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
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp,
    )
        required DateTime? startDate,
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

  int get startDateOffset {
    final startDate = this.startDate;
    if (startDate != null) {
      return startDate.difference(createdDateTime).inDays;
    } else {
      return 0;
    }
  }

  DateTime get goalDate {
    final startDate = this.startDate;
    if (startDate != null) {
      return startDate.add(Duration(days: (100 - startDateOffset) - 1));
    } else {
      return createdDateTime.add(const Duration(days: 100 - 1));
    }
  }
}
