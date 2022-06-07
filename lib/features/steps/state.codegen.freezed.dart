// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StepsStateTearOff {
  const _$StepsStateTearOff();

  _StepsState call({required User user, required List<Step> steps}) {
    return _StepsState(
      user: user,
      steps: steps,
    );
  }
}

/// @nodoc
const $StepsState = _$StepsStateTearOff();

/// @nodoc
mixin _$StepsState {
  User get user => throw _privateConstructorUsedError;
  List<Step> get steps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepsStateCopyWith<StepsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepsStateCopyWith<$Res> {
  factory $StepsStateCopyWith(
          StepsState value, $Res Function(StepsState) then) =
      _$StepsStateCopyWithImpl<$Res>;
  $Res call({User user, List<Step> steps});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$StepsStateCopyWithImpl<$Res> implements $StepsStateCopyWith<$Res> {
  _$StepsStateCopyWithImpl(this._value, this._then);

  final StepsState _value;
  // ignore: unused_field
  final $Res Function(StepsState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$StepsStateCopyWith<$Res> implements $StepsStateCopyWith<$Res> {
  factory _$StepsStateCopyWith(
          _StepsState value, $Res Function(_StepsState) then) =
      __$StepsStateCopyWithImpl<$Res>;
  @override
  $Res call({User user, List<Step> steps});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$StepsStateCopyWithImpl<$Res> extends _$StepsStateCopyWithImpl<$Res>
    implements _$StepsStateCopyWith<$Res> {
  __$StepsStateCopyWithImpl(
      _StepsState _value, $Res Function(_StepsState) _then)
      : super(_value, (v) => _then(v as _StepsState));

  @override
  _StepsState get _value => super._value as _StepsState;

  @override
  $Res call({
    Object? user = freezed,
    Object? steps = freezed,
  }) {
    return _then(_StepsState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>,
    ));
  }
}

/// @nodoc

class _$_StepsState extends _StepsState {
  _$_StepsState({required this.user, required this.steps}) : super._();

  @override
  final User user;
  @override
  final List<Step> steps;

  @override
  String toString() {
    return 'StepsState(user: $user, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StepsState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.steps, steps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(steps));

  @JsonKey(ignore: true)
  @override
  _$StepsStateCopyWith<_StepsState> get copyWith =>
      __$StepsStateCopyWithImpl<_StepsState>(this, _$identity);
}

abstract class _StepsState extends StepsState {
  factory _StepsState({required User user, required List<Step> steps}) =
      _$_StepsState;
  _StepsState._() : super._();

  @override
  User get user;
  @override
  List<Step> get steps;
  @override
  @JsonKey(ignore: true)
  _$StepsStateCopyWith<_StepsState> get copyWith =>
      throw _privateConstructorUsedError;
}
