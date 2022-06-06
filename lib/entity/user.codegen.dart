import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.codegen.freezed.dart';
part 'user.codegen.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  factory User({
    required String? id,
    required String twitterUserID,
    required String name,
    required String screenName,
    required String profileURL,
    required String profileImageURL,
  }) = _User;
  User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
