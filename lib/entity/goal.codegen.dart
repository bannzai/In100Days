import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_100_days/entity/twitter_tweet_api_response.codegen.dart';

part 'goal.codegen.freezed.dart';
part 'goal.codegen.g.dart';

@freezed
class Goal with _$Goal {
  @JsonSerializable(explicitToJson: true)
  factory Goal({
    required String goalAction,
    required String fullHashTag,
    required DateTime createdDateTime,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}
