// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'twitter_tweet_api_response.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TwitterTweetAPIResponse _$TwitterTweetAPIResponseFromJson(
    Map<String, dynamic> json) {
  return _TwitterTweetAPIResponse.fromJson(json);
}

/// @nodoc
class _$TwitterTweetAPIResponseTearOff {
  const _$TwitterTweetAPIResponseTearOff();

  _TwitterTweetAPIResponse call({required Tweet tweet}) {
    return _TwitterTweetAPIResponse(
      tweet: tweet,
    );
  }

  TwitterTweetAPIResponse fromJson(Map<String, Object?> json) {
    return TwitterTweetAPIResponse.fromJson(json);
  }
}

/// @nodoc
const $TwitterTweetAPIResponse = _$TwitterTweetAPIResponseTearOff();

/// @nodoc
mixin _$TwitterTweetAPIResponse {
  Tweet get tweet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TwitterTweetAPIResponseCopyWith<TwitterTweetAPIResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TwitterTweetAPIResponseCopyWith<$Res> {
  factory $TwitterTweetAPIResponseCopyWith(TwitterTweetAPIResponse value,
          $Res Function(TwitterTweetAPIResponse) then) =
      _$TwitterTweetAPIResponseCopyWithImpl<$Res>;
  $Res call({Tweet tweet});
}

/// @nodoc
class _$TwitterTweetAPIResponseCopyWithImpl<$Res>
    implements $TwitterTweetAPIResponseCopyWith<$Res> {
  _$TwitterTweetAPIResponseCopyWithImpl(this._value, this._then);

  final TwitterTweetAPIResponse _value;
  // ignore: unused_field
  final $Res Function(TwitterTweetAPIResponse) _then;

  @override
  $Res call({
    Object? tweet = freezed,
  }) {
    return _then(_value.copyWith(
      tweet: tweet == freezed
          ? _value.tweet
          : tweet // ignore: cast_nullable_to_non_nullable
              as Tweet,
    ));
  }
}

/// @nodoc
abstract class _$TwitterTweetAPIResponseCopyWith<$Res>
    implements $TwitterTweetAPIResponseCopyWith<$Res> {
  factory _$TwitterTweetAPIResponseCopyWith(_TwitterTweetAPIResponse value,
          $Res Function(_TwitterTweetAPIResponse) then) =
      __$TwitterTweetAPIResponseCopyWithImpl<$Res>;
  @override
  $Res call({Tweet tweet});
}

/// @nodoc
class __$TwitterTweetAPIResponseCopyWithImpl<$Res>
    extends _$TwitterTweetAPIResponseCopyWithImpl<$Res>
    implements _$TwitterTweetAPIResponseCopyWith<$Res> {
  __$TwitterTweetAPIResponseCopyWithImpl(_TwitterTweetAPIResponse _value,
      $Res Function(_TwitterTweetAPIResponse) _then)
      : super(_value, (v) => _then(v as _TwitterTweetAPIResponse));

  @override
  _TwitterTweetAPIResponse get _value =>
      super._value as _TwitterTweetAPIResponse;

  @override
  $Res call({
    Object? tweet = freezed,
  }) {
    return _then(_TwitterTweetAPIResponse(
      tweet: tweet == freezed
          ? _value.tweet
          : tweet // ignore: cast_nullable_to_non_nullable
              as Tweet,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TwitterTweetAPIResponse implements _TwitterTweetAPIResponse {
  _$_TwitterTweetAPIResponse({required this.tweet});

  factory _$_TwitterTweetAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TwitterTweetAPIResponseFromJson(json);

  @override
  final Tweet tweet;

  @override
  String toString() {
    return 'TwitterTweetAPIResponse(tweet: $tweet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TwitterTweetAPIResponse &&
            const DeepCollectionEquality().equals(other.tweet, tweet));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tweet));

  @JsonKey(ignore: true)
  @override
  _$TwitterTweetAPIResponseCopyWith<_TwitterTweetAPIResponse> get copyWith =>
      __$TwitterTweetAPIResponseCopyWithImpl<_TwitterTweetAPIResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TwitterTweetAPIResponseToJson(this);
  }
}

abstract class _TwitterTweetAPIResponse implements TwitterTweetAPIResponse {
  factory _TwitterTweetAPIResponse({required Tweet tweet}) =
      _$_TwitterTweetAPIResponse;

  factory _TwitterTweetAPIResponse.fromJson(Map<String, dynamic> json) =
      _$_TwitterTweetAPIResponse.fromJson;

  @override
  Tweet get tweet;
  @override
  @JsonKey(ignore: true)
  _$TwitterTweetAPIResponseCopyWith<_TwitterTweetAPIResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
