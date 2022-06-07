// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'goal.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return _Goal.fromJson(json);
}

/// @nodoc
class _$GoalTearOff {
  const _$GoalTearOff();

  _Goal call(
      {required String goalAction,
      required String fullHashTag,
      required DateTime createdDateTime}) {
    return _Goal(
      goalAction: goalAction,
      fullHashTag: fullHashTag,
      createdDateTime: createdDateTime,
    );
  }

  Goal fromJson(Map<String, Object?> json) {
    return Goal.fromJson(json);
  }
}

/// @nodoc
const $Goal = _$GoalTearOff();

/// @nodoc
mixin _$Goal {
  String get goalAction => throw _privateConstructorUsedError;
  String get fullHashTag => throw _privateConstructorUsedError;
  DateTime get createdDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalCopyWith<Goal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res>;
  $Res call({String goalAction, String fullHashTag, DateTime createdDateTime});
}

/// @nodoc
class _$GoalCopyWithImpl<$Res> implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._value, this._then);

  final Goal _value;
  // ignore: unused_field
  final $Res Function(Goal) _then;

  @override
  $Res call({
    Object? goalAction = freezed,
    Object? fullHashTag = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      goalAction: goalAction == freezed
          ? _value.goalAction
          : goalAction // ignore: cast_nullable_to_non_nullable
              as String,
      fullHashTag: fullHashTag == freezed
          ? _value.fullHashTag
          : fullHashTag // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) then) =
      __$GoalCopyWithImpl<$Res>;
  @override
  $Res call({String goalAction, String fullHashTag, DateTime createdDateTime});
}

/// @nodoc
class __$GoalCopyWithImpl<$Res> extends _$GoalCopyWithImpl<$Res>
    implements _$GoalCopyWith<$Res> {
  __$GoalCopyWithImpl(_Goal _value, $Res Function(_Goal) _then)
      : super(_value, (v) => _then(v as _Goal));

  @override
  _Goal get _value => super._value as _Goal;

  @override
  $Res call({
    Object? goalAction = freezed,
    Object? fullHashTag = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_Goal(
      goalAction: goalAction == freezed
          ? _value.goalAction
          : goalAction // ignore: cast_nullable_to_non_nullable
              as String,
      fullHashTag: fullHashTag == freezed
          ? _value.fullHashTag
          : fullHashTag // ignore: cast_nullable_to_non_nullable
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
class _$_Goal implements _Goal {
  _$_Goal(
      {required this.goalAction,
      required this.fullHashTag,
      required this.createdDateTime});

  factory _$_Goal.fromJson(Map<String, dynamic> json) => _$$_GoalFromJson(json);

  @override
  final String goalAction;
  @override
  final String fullHashTag;
  @override
  final DateTime createdDateTime;

  @override
  String toString() {
    return 'Goal(goalAction: $goalAction, fullHashTag: $fullHashTag, createdDateTime: $createdDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Goal &&
            const DeepCollectionEquality()
                .equals(other.goalAction, goalAction) &&
            const DeepCollectionEquality()
                .equals(other.fullHashTag, fullHashTag) &&
            const DeepCollectionEquality()
                .equals(other.createdDateTime, createdDateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(goalAction),
      const DeepCollectionEquality().hash(fullHashTag),
      const DeepCollectionEquality().hash(createdDateTime));

  @JsonKey(ignore: true)
  @override
  _$GoalCopyWith<_Goal> get copyWith =>
      __$GoalCopyWithImpl<_Goal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoalToJson(this);
  }
}

abstract class _Goal implements Goal {
  factory _Goal(
      {required String goalAction,
      required String fullHashTag,
      required DateTime createdDateTime}) = _$_Goal;

  factory _Goal.fromJson(Map<String, dynamic> json) = _$_Goal.fromJson;

  @override
  String get goalAction;
  @override
  String get fullHashTag;
  @override
  DateTime get createdDateTime;
  @override
  @JsonKey(ignore: true)
  _$GoalCopyWith<_Goal> get copyWith => throw _privateConstructorUsedError;
}
