import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.codegen.freezed.dart';
part 'user.codegen.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class User with _$User {
  factory User({
    required String twitterUserID,
    required String name,
    required String screenName,
    required String profileURL,
    required String profileImageURL,
  }) = _User;
  User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
