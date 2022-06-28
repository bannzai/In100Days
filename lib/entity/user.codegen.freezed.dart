// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String? id,
      required String twitterUserID,
      required String name,
      required String screenName,
      required String twitterAPIProfileImageURL,
      required String orignalProfileImageURL,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          required DateTime createdDateTime}) {
    return _User(
      id: id,
      twitterUserID: twitterUserID,
      name: name,
      screenName: screenName,
      twitterAPIProfileImageURL: twitterAPIProfileImageURL,
      orignalProfileImageURL: orignalProfileImageURL,
      createdDateTime: createdDateTime,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String get twitterUserID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get screenName =>
      throw _privateConstructorUsedError; // Maybe _normal image
  String get twitterAPIProfileImageURL => throw _privateConstructorUsedError;
  String get orignalProfileImageURL => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  DateTime get createdDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String twitterUserID,
      String name,
      String screenName,
      String twitterAPIProfileImageURL,
      String orignalProfileImageURL,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          DateTime createdDateTime});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? twitterUserID = freezed,
    Object? name = freezed,
    Object? screenName = freezed,
    Object? twitterAPIProfileImageURL = freezed,
    Object? orignalProfileImageURL = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      twitterUserID: twitterUserID == freezed
          ? _value.twitterUserID
          : twitterUserID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      screenName: screenName == freezed
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String,
      twitterAPIProfileImageURL: twitterAPIProfileImageURL == freezed
          ? _value.twitterAPIProfileImageURL
          : twitterAPIProfileImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      orignalProfileImageURL: orignalProfileImageURL == freezed
          ? _value.orignalProfileImageURL
          : orignalProfileImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String twitterUserID,
      String name,
      String screenName,
      String twitterAPIProfileImageURL,
      String orignalProfileImageURL,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          DateTime createdDateTime});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? twitterUserID = freezed,
    Object? name = freezed,
    Object? screenName = freezed,
    Object? twitterAPIProfileImageURL = freezed,
    Object? orignalProfileImageURL = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      twitterUserID: twitterUserID == freezed
          ? _value.twitterUserID
          : twitterUserID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      screenName: screenName == freezed
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String,
      twitterAPIProfileImageURL: twitterAPIProfileImageURL == freezed
          ? _value.twitterAPIProfileImageURL
          : twitterAPIProfileImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      orignalProfileImageURL: orignalProfileImageURL == freezed
          ? _value.orignalProfileImageURL
          : orignalProfileImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_User extends _User {
  _$_User(
      {required this.id,
      required this.twitterUserID,
      required this.name,
      required this.screenName,
      required this.twitterAPIProfileImageURL,
      required this.orignalProfileImageURL,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          required this.createdDateTime})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String twitterUserID;
  @override
  final String name;
  @override
  final String screenName;
  @override // Maybe _normal image
  final String twitterAPIProfileImageURL;
  @override
  final String orignalProfileImageURL;
  @override
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  final DateTime createdDateTime;

  @override
  String toString() {
    return 'User(id: $id, twitterUserID: $twitterUserID, name: $name, screenName: $screenName, twitterAPIProfileImageURL: $twitterAPIProfileImageURL, orignalProfileImageURL: $orignalProfileImageURL, createdDateTime: $createdDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.twitterUserID, twitterUserID) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.screenName, screenName) &&
            const DeepCollectionEquality().equals(
                other.twitterAPIProfileImageURL, twitterAPIProfileImageURL) &&
            const DeepCollectionEquality()
                .equals(other.orignalProfileImageURL, orignalProfileImageURL) &&
            const DeepCollectionEquality()
                .equals(other.createdDateTime, createdDateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(twitterUserID),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(screenName),
      const DeepCollectionEquality().hash(twitterAPIProfileImageURL),
      const DeepCollectionEquality().hash(orignalProfileImageURL),
      const DeepCollectionEquality().hash(createdDateTime));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {required String? id,
      required String twitterUserID,
      required String name,
      required String screenName,
      required String twitterAPIProfileImageURL,
      required String orignalProfileImageURL,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          required DateTime createdDateTime}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id;
  @override
  String get twitterUserID;
  @override
  String get name;
  @override
  String get screenName;
  @override // Maybe _normal image
  String get twitterAPIProfileImageURL;
  @override
  String get orignalProfileImageURL;
  @override
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  DateTime get createdDateTime;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
