library asset_history;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_history.g.dart';

abstract class AssetHistory
    implements Built<AssetHistory, AssetHistoryBuilder> {
  AssetHistory._();

  factory AssetHistory([updates(AssetHistoryBuilder b)]) = _$AssetHistory;

  @BuiltValueField(wireName: 'assetHistoryID')
  String get assetHistoryID;
  @BuiltValueField(wireName: 'employeeId')
  String get employeeId;
  @BuiltValueField(wireName: 'type')
  String get type;
  @BuiltValueField(wireName: 'assetID')
  String get assetID;
  @BuiltValueField(wireName: 'checkoutTime')
  DateTime get checkoutTime;
  @BuiltValueField(wireName: 'checkinTime')
  DateTime get checkinTime;

  static Serializer<AssetHistory> get serializer => _$assetHistorySerializer;
}
