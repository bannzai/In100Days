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
class _$RecordsStateTearOff {
  const _$RecordsStateTearOff();

  _RecordsState call({required User user, required List<Record> records}) {
    return _RecordsState(
      user: user,
      records: records,
    );
  }
}

/// @nodoc
const $RecordsState = _$RecordsStateTearOff();

/// @nodoc
mixin _$RecordsState {
  User get user => throw _privateConstructorUsedError;
  List<Record> get records => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordsStateCopyWith<RecordsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsStateCopyWith<$Res> {
  factory $RecordsStateCopyWith(
          RecordsState value, $Res Function(RecordsState) then) =
      _$RecordsStateCopyWithImpl<$Res>;
  $Res call({User user, List<Record> records});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$RecordsStateCopyWithImpl<$Res> implements $RecordsStateCopyWith<$Res> {
  _$RecordsStateCopyWithImpl(this._value, this._then);

  final RecordsState _value;
  // ignore: unused_field
  final $Res Function(RecordsState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? records = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      records: records == freezed
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<Record>,
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
abstract class _$RecordsStateCopyWith<$Res>
    implements $RecordsStateCopyWith<$Res> {
  factory _$RecordsStateCopyWith(
          _RecordsState value, $Res Function(_RecordsState) then) =
      __$RecordsStateCopyWithImpl<$Res>;
  @override
  $Res call({User user, List<Record> records});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$RecordsStateCopyWithImpl<$Res> extends _$RecordsStateCopyWithImpl<$Res>
    implements _$RecordsStateCopyWith<$Res> {
  __$RecordsStateCopyWithImpl(
      _RecordsState _value, $Res Function(_RecordsState) _then)
      : super(_value, (v) => _then(v as _RecordsState));

  @override
  _RecordsState get _value => super._value as _RecordsState;

  @override
  $Res call({
    Object? user = freezed,
    Object? records = freezed,
  }) {
    return _then(_RecordsState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      records: records == freezed
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<Record>,
    ));
  }
}

/// @nodoc

class _$_RecordsState extends _RecordsState {
  _$_RecordsState({required this.user, required this.records}) : super._();

  @override
  final User user;
  @override
  final List<Record> records;

  @override
  String toString() {
    return 'RecordsState(user: $user, records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecordsState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.records, records));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(records));

  @JsonKey(ignore: true)
  @override
  _$RecordsStateCopyWith<_RecordsState> get copyWith =>
      __$RecordsStateCopyWithImpl<_RecordsState>(this, _$identity);
}

abstract class _RecordsState extends RecordsState {
  factory _RecordsState({required User user, required List<Record> records}) =
      _$_RecordsState;
  _RecordsState._() : super._();

  @override
  User get user;
  @override
  List<Record> get records;
  @override
  @JsonKey(ignore: true)
  _$RecordsStateCopyWith<_RecordsState> get copyWith =>
      throw _privateConstructorUsedError;
}
