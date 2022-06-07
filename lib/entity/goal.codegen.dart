import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.codegen.freezed.dart';
part 'goal.codegen.g.dart';

@freezed
class Goal with _$Goal {
  @JsonSerializable(explicitToJson: true)
  factory Goal({
    String? id,
    required String goalAction,
    required String fullHashTag,
    required DateTime createdDateTime,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}
