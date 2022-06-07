// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'step.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Step _$StepFromJson(Map<String, dynamic> json) {
  return _Step.fromJson(json);
}

/// @nodoc
class _$StepTearOff {
  const _$StepTearOff();

  _Step call(
      {required String stepAction,
      required String fullHashTag,
      required DateTime createdDateTime}) {
    return _Step(
      stepAction: stepAction,
      fullHashTag: fullHashTag,
      createdDateTime: createdDateTime,
    );
  }

  Step fromJson(Map<String, Object?> json) {
    return Step.fromJson(json);
  }
}

/// @nodoc
const $Step = _$StepTearOff();

/// @nodoc
mixin _$Step {
  String get stepAction => throw _privateConstructorUsedError;
  String get fullHashTag => throw _privateConstructorUsedError;
  DateTime get createdDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepCopyWith<Step> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCopyWith<$Res> {
  factory $StepCopyWith(Step value, $Res Function(Step) then) =
      _$StepCopyWithImpl<$Res>;
  $Res call({String stepAction, String fullHashTag, DateTime createdDateTime});
}

/// @nodoc
class _$StepCopyWithImpl<$Res> implements $StepCopyWith<$Res> {
  _$StepCopyWithImpl(this._value, this._then);

  final Step _value;
  // ignore: unused_field
  final $Res Function(Step) _then;

  @override
  $Res call({
    Object? stepAction = freezed,
    Object? fullHashTag = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      stepAction: stepAction == freezed
          ? _value.stepAction
          : stepAction // ignore: cast_nullable_to_non_nullable
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
abstract class _$StepCopyWith<$Res> implements $StepCopyWith<$Res> {
  factory _$StepCopyWith(_Step value, $Res Function(_Step) then) =
      __$StepCopyWithImpl<$Res>;
  @override
  $Res call({String stepAction, String fullHashTag, DateTime createdDateTime});
}

/// @nodoc
class __$StepCopyWithImpl<$Res> extends _$StepCopyWithImpl<$Res>
    implements _$StepCopyWith<$Res> {
  __$StepCopyWithImpl(_Step _value, $Res Function(_Step) _then)
      : super(_value, (v) => _then(v as _Step));

  @override
  _Step get _value => super._value as _Step;

  @override
  $Res call({
    Object? stepAction = freezed,
    Object? fullHashTag = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_Step(
      stepAction: stepAction == freezed
          ? _value.stepAction
          : stepAction // ignore: cast_nullable_to_non_nullable
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
class _$_Step implements _Step {
  _$_Step(
      {required this.stepAction,
      required this.fullHashTag,
      required this.createdDateTime});

  factory _$_Step.fromJson(Map<String, dynamic> json) => _$$_StepFromJson(json);

  @override
  final String stepAction;
  @override
  final String fullHashTag;
  @override
  final DateTime createdDateTime;

  @override
  String toString() {
    return 'Step(stepAction: $stepAction, fullHashTag: $fullHashTag, createdDateTime: $createdDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Step &&
            const DeepCollectionEquality()
                .equals(other.stepAction, stepAction) &&
            const DeepCollectionEquality()
                .equals(other.fullHashTag, fullHashTag) &&
            const DeepCollectionEquality()
                .equals(other.createdDateTime, createdDateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stepAction),
      const DeepCollectionEquality().hash(fullHashTag),
      const DeepCollectionEquality().hash(createdDateTime));

  @JsonKey(ignore: true)
  @override
  _$StepCopyWith<_Step> get copyWith =>
      __$StepCopyWithImpl<_Step>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepToJson(this);
  }
}

abstract class _Step implements Step {
  factory _Step(
      {required String stepAction,
      required String fullHashTag,
      required DateTime createdDateTime}) = _$_Step;

  factory _Step.fromJson(Map<String, dynamic> json) = _$_Step.fromJson;

  @override
  String get stepAction;
  @override
  String get fullHashTag;
  @override
  DateTime get createdDateTime;
  @override
  @JsonKey(ignore: true)
  _$StepCopyWith<_Step> get copyWith => throw _privateConstructorUsedError;
}
