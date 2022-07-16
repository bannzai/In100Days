// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchased_product.codegen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchasedProduct _$PurchasedProductFromJson(Map<String, dynamic> json) {
  return _PurchasedProduct.fromJson(json);
}

/// @nodoc
class _$PurchasedProductTearOff {
  const _$PurchasedProductTearOff();

  _PurchasedProduct call(
      {required Product product,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          required DateTime purchasedDateTime}) {
    return _PurchasedProduct(
      product: product,
      purchasedDateTime: purchasedDateTime,
    );
  }

  PurchasedProduct fromJson(Map<String, Object?> json) {
    return PurchasedProduct.fromJson(json);
  }
}

/// @nodoc
const $PurchasedProduct = _$PurchasedProductTearOff();

/// @nodoc
mixin _$PurchasedProduct {
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  DateTime get purchasedDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchasedProductCopyWith<PurchasedProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasedProductCopyWith<$Res> {
  factory $PurchasedProductCopyWith(
          PurchasedProduct value, $Res Function(PurchasedProduct) then) =
      _$PurchasedProductCopyWithImpl<$Res>;
  $Res call(
      {Product product,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          DateTime purchasedDateTime});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$PurchasedProductCopyWithImpl<$Res>
    implements $PurchasedProductCopyWith<$Res> {
  _$PurchasedProductCopyWithImpl(this._value, this._then);

  final PurchasedProduct _value;
  // ignore: unused_field
  final $Res Function(PurchasedProduct) _then;

  @override
  $Res call({
    Object? product = freezed,
    Object? purchasedDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      purchasedDateTime: purchasedDateTime == freezed
          ? _value.purchasedDateTime
          : purchasedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$PurchasedProductCopyWith<$Res>
    implements $PurchasedProductCopyWith<$Res> {
  factory _$PurchasedProductCopyWith(
          _PurchasedProduct value, $Res Function(_PurchasedProduct) then) =
      __$PurchasedProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {Product product,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          DateTime purchasedDateTime});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$PurchasedProductCopyWithImpl<$Res>
    extends _$PurchasedProductCopyWithImpl<$Res>
    implements _$PurchasedProductCopyWith<$Res> {
  __$PurchasedProductCopyWithImpl(
      _PurchasedProduct _value, $Res Function(_PurchasedProduct) _then)
      : super(_value, (v) => _then(v as _PurchasedProduct));

  @override
  _PurchasedProduct get _value => super._value as _PurchasedProduct;

  @override
  $Res call({
    Object? product = freezed,
    Object? purchasedDateTime = freezed,
  }) {
    return _then(_PurchasedProduct(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      purchasedDateTime: purchasedDateTime == freezed
          ? _value.purchasedDateTime
          : purchasedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PurchasedProduct extends _PurchasedProduct {
  _$_PurchasedProduct(
      {required this.product,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          required this.purchasedDateTime})
      : super._();

  factory _$_PurchasedProduct.fromJson(Map<String, dynamic> json) =>
      _$$_PurchasedProductFromJson(json);

  @override
  final Product product;
  @override
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  final DateTime purchasedDateTime;

  @override
  String toString() {
    return 'PurchasedProduct(product: $product, purchasedDateTime: $purchasedDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchasedProduct &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality()
                .equals(other.purchasedDateTime, purchasedDateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(purchasedDateTime));

  @JsonKey(ignore: true)
  @override
  _$PurchasedProductCopyWith<_PurchasedProduct> get copyWith =>
      __$PurchasedProductCopyWithImpl<_PurchasedProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchasedProductToJson(this);
  }
}

abstract class _PurchasedProduct extends PurchasedProduct {
  factory _PurchasedProduct(
      {required Product product,
      @JsonKey(fromJson: NonNullTimestampConverter.timestampToDateTime, toJson: NonNullTimestampConverter.dateTimeToTimestamp)
          required DateTime purchasedDateTime}) = _$_PurchasedProduct;
  _PurchasedProduct._() : super._();

  factory _PurchasedProduct.fromJson(Map<String, dynamic> json) =
      _$_PurchasedProduct.fromJson;

  @override
  Product get product;
  @override
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  DateTime get purchasedDateTime;
  @override
  @JsonKey(ignore: true)
  _$PurchasedProductCopyWith<_PurchasedProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
