import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_100_days/entity/timestam_converter.dart';

part 'user.codegen.freezed.dart';
part 'user.codegen.g.dart';

// Reference: https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/user
@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  factory User({
    required String? id,
    required String twitterUserID,
    required String name,
    required String screenName,
    // Maybe _normal image
    required String twitterAPIProfileImageURL,
    required String orignalProfileImageURL,
    @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp,
    )
        required DateTime createdDateTime,
  }) = _User;
  User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String get twitterID => screenName;
}
