// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tweet.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TweetSearch _$TweetSearchFromJson(Map<String, dynamic> json) {
  return _TweetSearch.fromJson(json);
}

/// @nodoc
class _$TweetSearchTearOff {
  const _$TweetSearchTearOff();

  _TweetSearch call(
      {required TwitterTweetAPIResponse response,
      required DateTime createdDateTime}) {
    return _TweetSearch(
      response: response,
      createdDateTime: createdDateTime,
    );
  }

  TweetSearch fromJson(Map<String, Object?> json) {
    return TweetSearch.fromJson(json);
  }
}

/// @nodoc
const $TweetSearch = _$TweetSearchTearOff();

/// @nodoc
mixin _$TweetSearch {
  TwitterTweetAPIResponse get response => throw _privateConstructorUsedError;
  DateTime get createdDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetSearchCopyWith<TweetSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetSearchCopyWith<$Res> {
  factory $TweetSearchCopyWith(
          TweetSearch value, $Res Function(TweetSearch) then) =
      _$TweetSearchCopyWithImpl<$Res>;
  $Res call({TwitterTweetAPIResponse response, DateTime createdDateTime});
}

/// @nodoc
class _$TweetSearchCopyWithImpl<$Res> implements $TweetSearchCopyWith<$Res> {
  _$TweetSearchCopyWithImpl(this._value, this._then);

  final TweetSearch _value;
  // ignore: unused_field
  final $Res Function(TweetSearch) _then;

  @override
  $Res call({
    Object? response = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as TwitterTweetAPIResponse,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TweetSearchCopyWith<$Res>
    implements $TweetSearchCopyWith<$Res> {
  factory _$TweetSearchCopyWith(
          _TweetSearch value, $Res Function(_TweetSearch) then) =
      __$TweetSearchCopyWithImpl<$Res>;
  @override
  $Res call({TwitterTweetAPIResponse response, DateTime createdDateTime});
}

/// @nodoc
class __$TweetSearchCopyWithImpl<$Res> extends _$TweetSearchCopyWithImpl<$Res>
    implements _$TweetSearchCopyWith<$Res> {
  __$TweetSearchCopyWithImpl(
      _TweetSearch _value, $Res Function(_TweetSearch) _then)
      : super(_value, (v) => _then(v as _TweetSearch));

  @override
  _TweetSearch get _value => super._value as _TweetSearch;

  @override
  $Res call({
    Object? response = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_TweetSearch(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as TwitterTweetAPIResponse,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TweetSearch implements _TweetSearch {
  _$_TweetSearch({required this.response, required this.createdDateTime});

  factory _$_TweetSearch.fromJson(Map<String, dynamic> json) =>
      _$$_TweetSearchFromJson(json);

  @override
  final TwitterTweetAPIResponse response;
  @override
  final DateTime createdDateTime;

  @override
  String toString() {
    return 'TweetSearch(response: $response, createdDateTime: $createdDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TweetSearch &&
            const DeepCollectionEquality().equals(other.response, response) &&
            const DeepCollectionEquality()
                .equals(other.createdDateTime, createdDateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(response),
      const DeepCollectionEquality().hash(createdDateTime));

  @JsonKey(ignore: true)
  @override
  _$TweetSearchCopyWith<_TweetSearch> get copyWith =>
      __$TweetSearchCopyWithImpl<_TweetSearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TweetSearchToJson(this);
  }
}

abstract class _TweetSearch implements TweetSearch {
  factory _TweetSearch(
      {required TwitterTweetAPIResponse response,
      required DateTime createdDateTime}) = _$_TweetSearch;

  factory _TweetSearch.fromJson(Map<String, dynamic> json) =
      _$_TweetSearch.fromJson;

  @override
  TwitterTweetAPIResponse get response;
  @override
  DateTime get createdDateTime;
  @override
  @JsonKey(ignore: true)
  _$TweetSearchCopyWith<_TweetSearch> get copyWith =>
      throw _privateConstructorUsedError;
}
