library enums;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_types.g.dart';

/// Example of how to use [EnumClass].
///
/// Enum constants must be declared as `static const`. Initialize them from
/// the generated code. You can use any initializer starting _$ and the
/// generated code will match it. For example, you could initialize "yes" to
/// "_$yes", "_$y" or even "_$abc".
///
/// You need to write three pieces of boilerplate to hook up the generated
/// code: a constructor called `_`, a `values` method, and a `valueOf` method.
class OrderType extends EnumClass {
  /// Example of how to make an [EnumClass] serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_value code generator will provide the implementation. You need
  /// to do this for every type you want to serialize.
  static Serializer<OrderType> get serializer => _$orderTypeSerializer;

  static const Workorder = "Work Order";
  // static const String Estimate = "Estimate";
  static const Invoice = "Invoice";
  // static const String Voided = "Voided";

  const OrderType._(String name) : super(name);

  static BuiltSet<OrderType> get values => _$values;
  static OrderType valueOf(String name) => _$valueOf(name);
}
