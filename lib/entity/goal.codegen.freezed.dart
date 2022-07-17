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
      {String? id,
      required String goalAction,
      required String hashTag,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          required DateTime createdDateTime,
      required List<PurchasedProduct> purchasedProducts}) {
    return _Goal(
      id: id,
      goalAction: goalAction,
      hashTag: hashTag,
      createdDateTime: createdDateTime,
      purchasedProducts: purchasedProducts,
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
  String? get id => throw _privateConstructorUsedError;
  String get goalAction => throw _privateConstructorUsedError;
  String get hashTag => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  DateTime get createdDateTime => throw _privateConstructorUsedError;
  List<PurchasedProduct> get purchasedProducts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalCopyWith<Goal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String goalAction,
      String hashTag,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          DateTime createdDateTime,
      List<PurchasedProduct> purchasedProducts});
}

/// @nodoc
class _$GoalCopyWithImpl<$Res> implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._value, this._then);

  final Goal _value;
  // ignore: unused_field
  final $Res Function(Goal) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? goalAction = freezed,
    Object? hashTag = freezed,
    Object? createdDateTime = freezed,
    Object? purchasedProducts = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      goalAction: goalAction == freezed
          ? _value.goalAction
          : goalAction // ignore: cast_nullable_to_non_nullable
              as String,
      hashTag: hashTag == freezed
          ? _value.hashTag
          : hashTag // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchasedProducts: purchasedProducts == freezed
          ? _value.purchasedProducts
          : purchasedProducts // ignore: cast_nullable_to_non_nullable
              as List<PurchasedProduct>,
    ));
  }
}

/// @nodoc
abstract class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) then) =
      __$GoalCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String goalAction,
      String hashTag,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          DateTime createdDateTime,
      List<PurchasedProduct> purchasedProducts});
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
    Object? id = freezed,
    Object? goalAction = freezed,
    Object? hashTag = freezed,
    Object? createdDateTime = freezed,
    Object? purchasedProducts = freezed,
  }) {
    return _then(_Goal(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      goalAction: goalAction == freezed
          ? _value.goalAction
          : goalAction // ignore: cast_nullable_to_non_nullable
              as String,
      hashTag: hashTag == freezed
          ? _value.hashTag
          : hashTag // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchasedProducts: purchasedProducts == freezed
          ? _value.purchasedProducts
          : purchasedProducts // ignore: cast_nullable_to_non_nullable
              as List<PurchasedProduct>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Goal extends _Goal {
  _$_Goal(
      {this.id,
      required this.goalAction,
      required this.hashTag,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          required this.createdDateTime,
      required this.purchasedProducts})
      : super._();

  factory _$_Goal.fromJson(Map<String, dynamic> json) => _$$_GoalFromJson(json);

  @override
  final String? id;
  @override
  final String goalAction;
  @override
  final String hashTag;
  @override
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  final DateTime createdDateTime;
  @override
  final List<PurchasedProduct> purchasedProducts;

  @override
  String toString() {
    return 'Goal(id: $id, goalAction: $goalAction, hashTag: $hashTag, createdDateTime: $createdDateTime, purchasedProducts: $purchasedProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Goal &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.goalAction, goalAction) &&
            const DeepCollectionEquality().equals(other.hashTag, hashTag) &&
            const DeepCollectionEquality()
                .equals(other.createdDateTime, createdDateTime) &&
            const DeepCollectionEquality()
                .equals(other.purchasedProducts, purchasedProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(goalAction),
      const DeepCollectionEquality().hash(hashTag),
      const DeepCollectionEquality().hash(createdDateTime),
      const DeepCollectionEquality().hash(purchasedProducts));

  @JsonKey(ignore: true)
  @override
  _$GoalCopyWith<_Goal> get copyWith =>
      __$GoalCopyWithImpl<_Goal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoalToJson(this);
  }
}

abstract class _Goal extends Goal {
  factory _Goal(
      {String? id,
      required String goalAction,
      required String hashTag,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          required DateTime createdDateTime,
      required List<PurchasedProduct> purchasedProducts}) = _$_Goal;
  _Goal._() : super._();

  factory _Goal.fromJson(Map<String, dynamic> json) = _$_Goal.fromJson;

  @override
  String? get id;
  @override
  String get goalAction;
  @override
  String get hashTag;
  @override
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  DateTime get createdDateTime;
  @override
  List<PurchasedProduct> get purchasedProducts;
  @override
  @JsonKey(ignore: true)
  _$GoalCopyWith<_Goal> get copyWith => throw _privateConstructorUsedError;
}
