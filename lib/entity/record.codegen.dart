import 'package:freezed_annotation/freezed_annotation.dart';

part 'record.codegen.freezed.dart';
part 'record.codegen.g.dart';

@freezed
class Record with _$Record {
  @JsonSerializable(explicitToJson: true)
  factory Record({
    required String message,
    required String hashTag,
    required DateTime createdDateTime,
  }) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
