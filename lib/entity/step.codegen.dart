import 'package:freezed_annotation/freezed_annotation.dart';

part 'step.codegen.freezed.dart';
part 'step.codegen.g.dart';

@freezed
class Step with _$Step {
  @JsonSerializable(explicitToJson: true)
  factory Step({
    required String stepAction,
    required String fullHashTag,
    required DateTime createdDateTime,
  }) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}
