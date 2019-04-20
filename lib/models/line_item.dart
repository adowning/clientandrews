library line_item;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'line_item.g.dart';

abstract class LineItem implements Built<LineItem, LineItemBuilder> {
  LineItem._();

  factory LineItem([updates(LineItemBuilder b)]) = _$LineItem;

  @BuiltValueField(wireName: 'row_number')
  int get rowNumber;
  @BuiltValueField(wireName: 'lineItemID')
  String get lineItemID;
  @BuiltValueField(wireName: 'companyID')
  String get companyID;
  @BuiltValueField(wireName: 'description')
  String get description;
  @BuiltValueField(wireName: 'discountAmount')
  int get discountAmount;
  @BuiltValueField(wireName: 'discountPercent')
  int get discountPercent;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'itemID')
  String get itemID;
  @BuiltValueField(wireName: 'orderID')
  String get orderID;
  @BuiltValueField(wireName: 'price')
  int get price;
  @BuiltValueField(wireName: 'quantity')
  int get quantity;
  @BuiltValueField(wireName: 'rowIndex')
  int get rowIndex;
  @BuiltValueField(wireName: 'taxed')
  bool get taxed;
  @BuiltValueField(wireName: 'total')
  int get total;
  @BuiltValueField(wireName: 'upsale')
  bool get upsale;

  static Serializer<LineItem> get serializer => _$lineItemSerializer;
}
