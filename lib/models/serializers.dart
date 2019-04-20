library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'workorder.dart';
import 'account.dart';
import 'line_item.dart';
import 'service_item.dart';
import 'asset_history.dart';
import 'order_types.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:built_value/standard_json_plugin.dart";
import 'package:intl/intl.dart';
part 'serializers.g.dart';

/// Collection of generated serializers for the built_value chat example.
@SerializersFor(
    [Workorder, Account, ServiceItem, OrderType, LineItem, AssetHistory])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(StringDateTimeSerializerPlugin())
      ..addPlugin(new TimestampSerializerPlugin()))
    .build();

class TimestampSerializerPlugin implements SerializerPlugin {
  @override
  Object beforeSerialize(Object object, FullType specifiedType) {
    if (object is DateTime && specifiedType.root == DateTime)
      return object.toUtc();
    return object;
  }

  @override
  Object afterSerialize(Object object, FullType specifiedType) {
    if (specifiedType.root == DateTime)
      return Timestamp.fromMicrosecondsSinceEpoch(object);
    return object;
  }

  @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
    if (object is Timestamp && specifiedType.root == DateTime) {
      return object.microsecondsSinceEpoch;
      // return object.toDate();
    } else {
      return object;
    }
  }

  @override
  Object afterDeserialize(Object object, FullType specifiedType) {
    return object;
  }
}

class StringDateTimeSerializerPlugin implements SerializerPlugin {
  @override
  Object beforeSerialize(Object object, FullType specifiedType) {
    if (object is int && specifiedType.root == DateTime) {
      return DateTime(object).millisecondsSinceEpoch;
      // return object.toDate();
    } else {
      return object;
    }
  }

  @override
  Object afterSerialize(Object object, FullType specifiedType) {
    return object;
  }

  @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
    if (object is int && specifiedType.root == DateTime) {
      return DateTime(object).microsecondsSinceEpoch;
    } else {
      if (object is String && specifiedType.root == DateTime) {
        return DateTime.parse(object).microsecondsSinceEpoch;
      } else {
        return object;
      }
    }
  }

  @override
  Object afterDeserialize(Object object, FullType specifiedType) {
    return object;
  }
}
