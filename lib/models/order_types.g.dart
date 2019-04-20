// GENERATED CODE - DO NOT MODIFY BY HAND

part of enums;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

OrderType _$valueOf(String name) {
  switch (name) {
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<OrderType> _$values =
    new BuiltSet<OrderType>(const <OrderType>[]);

Serializer<OrderType> _$orderTypeSerializer = new _$OrderTypeSerializer();

class _$OrderTypeSerializer implements PrimitiveSerializer<OrderType> {
  @override
  final Iterable<Type> types = const <Type>[OrderType];
  @override
  final String wireName = 'OrderType';

  @override
  Object serialize(Serializers serializers, OrderType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  OrderType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      OrderType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
