library workorder;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'order_types.dart';
import 'package:uuid/uuid.dart';

part 'workorder.g.dart';

abstract class Workorder implements Built<Workorder, WorkorderBuilder> {
  Workorder._();

  @BuiltValueField(wireName: 'orderID')
  String get orderID;
  @BuiltValueField(wireName: 'accountID')
  String get accountID;
  @BuiltValueField(wireName: 'accountName')
  String get accountName;
  @BuiltValueField(wireName: 'address1')
  @nullable
  String get address1;
  @BuiltValueField(wireName: 'city')
  @nullable
  String get city;
  @BuiltValueField(wireName: 'state')
  @nullable
  String get state;
  @BuiltValueField(wireName: 'zip')
  @nullable
  String get zip;
  @BuiltValueField(wireName: 'companyID')
  @nullable
  String get companyID;
  @BuiltValueField(wireName: 'correction')
  double get correction;
  @BuiltValueField(wireName: 'createdBy')
  String get createdBy;
  @BuiltValueField(wireName: 'createdOn')
  DateTime get createdOn;
  @BuiltValueField(wireName: 'dateCompleted')
  @nullable
  DateTime get dateCompleted;
  @BuiltValueField(wireName: 'dateCreated')
  DateTime get dateCreated;
  @BuiltValueField(wireName: 'discountPercent')
  double get discountPercent;
  @BuiltValueField(wireName: 'balanceDue')
  double get balanceDue;
  @BuiltValueField(wireName: 'dueDate')
  DateTime get dueDate;
  @BuiltValueField(wireName: 'flagForReview')
  bool get flagForReview;
  @BuiltValueField(wireName: 'grandTotal')
  double get grandTotal;
  @BuiltValueField(wireName: 'tipCollected')
  double get tipCollected;
  @BuiltValueField(wireName: 'group')
  String get group;
  @BuiltValueField(wireName: 'orderNumber')
  @nullable
  int get orderNumber;
  @BuiltValueField(wireName: 'orderType')
  String get orderType;
  @BuiltValueField(wireName: 'originalType')
  String get originalType;
  @BuiltValueField(wireName: 'postToAccounting')
  bool get postToAccounting;
  @BuiltValueField(wireName: 'printStyleID')
  String get printStyleID;
  @BuiltValueField(wireName: 'siteID')
  String get siteID;
  @BuiltValueField(wireName: 'subTotal')
  double get subTotal;
  @BuiltValueField(wireName: 'taxID')
  String get taxID;
  @BuiltValueField(wireName: 'taxRate')
  double get taxRate;
  @BuiltValueField(wireName: 'timeStamp')
  DateTime get timeStamp;
  @BuiltValueField(wireName: 'taxTotal')
  double get taxTotal;
  @BuiltValueField(wireName: 'userName')
  String get userName;
  @BuiltValueField(wireName: 'merchantFeesTotal')
  double get merchantFeesTotal;
  @BuiltValueField(wireName: 'needsDelivered')
  bool get needsDelivered;
  @BuiltValueField(wireName: 'notes')
  String get notes;
  String get serviceType;

  static Serializer<Workorder> get serializer => _$workorderSerializer;

  // factory Workorder([updates(WorkorderBuilder b)]) = _$Workorder;
  factory Workorder([void Function(WorkorderBuilder) updates]) = _$Workorder;
}

abstract class WorkorderBuilder
    implements Builder<Workorder, WorkorderBuilder> {
  /// Builder fields must be marked "@virtual". This is a language feature that
  /// allows them to be overriden.
  String orderID = new Uuid().toString();
  String accountID;
  String accountName;
  String address1;
  String city;
  String state;
  String zip;
  String companyID = '10112';
  double correction = 0;
  String createdBy;
  DateTime createdOn = DateTime.now();
  DateTime dateCompleted;
  DateTime dateCreated = DateTime.now();
  double discountPercent = 0;
  double balanceDue = 0.0;
  DateTime dueDate = DateTime.now().add(Duration(days: 21));
  bool flagForReview = false;
  double grandTotal = 0;
  double tipCollected = 0;
  String group = '';
  int orderNumber;
  String orderType;
  String originalType;
  bool postToAccounting = false;
  String printStyleID;
  String siteID;
  double subTotal = 0.0;
  String taxID = 'todo, put in later';
  double taxRate = 8.25;
  DateTime timeStamp;
  double taxTotal = 0;
  String userName;
  double merchantFeesTotal = 0;
  bool needsDelivered = false;
  String notes = "";
  String serviceType = "imported";

  factory WorkorderBuilder() = _$WorkorderBuilder;
  WorkorderBuilder._();
}
