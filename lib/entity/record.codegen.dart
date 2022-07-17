import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_100_days/entity/timestam_converter.dart';

part 'record.codegen.freezed.dart';
part 'record.codegen.g.dart';

@freezed
class Record with _$Record {
  @JsonSerializable(explicitToJson: true)
  factory Record({
    required String tweetID,
    required String message,
    required String hashTag,
    @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp,
    )
        required DateTime createdDateTime,
    @Default(false)
        bool isConguratulation,
  }) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
