library account;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'account.g.dart';

abstract class Account implements Built<Account, AccountBuilder> {
  Account._();

  factory Account([updates(AccountBuilder b)]) = _$Account;

  @BuiltValueField(wireName: 'accountID')
  @nullable
  String get accountID;
  @BuiltValueField(wireName: 'AccountName')
  @nullable
  String get accountName;
  @BuiltValueField(wireName: 'AccountType')
  @nullable
  String get accountType;
  @BuiltValueField(wireName: 'Address1')
  @nullable
  String get address1;
  @BuiltValueField(wireName: 'Alert')
  @nullable
  bool get alert;
  @BuiltValueField(wireName: 'City')
  @nullable
  String get city;
  @BuiltValueField(wireName: 'CompanyID')
  @nullable
  String get companyID;
  @BuiltValueField(wireName: 'CompanyName')
  @nullable
  String get companyName;
  @BuiltValueField(wireName: 'Country')
  @nullable
  String get country;
  @BuiltValueField(wireName: 'County')
  @nullable
  String get county;
  @BuiltValueField(wireName: 'Email')
  @nullable
  String get email;
  @BuiltValueField(wireName: 'FirstName')
  @nullable
  String get firstName;
  @BuiltValueField(wireName: 'LastName')
  @nullable
  String get lastName;
  @BuiltValueField(wireName: 'LeadSourceID')
  @nullable
  String get leadSourceID;
  @BuiltValueField(wireName: 'State')
  @nullable
  String get state;
  @BuiltValueField(wireName: 'notes')
  @nullable
  String get notes;
  @BuiltValueField(wireName: 'Zip')
  @nullable
  int get zip;
  @BuiltValueField(wireName: 'ActiveOrder')
  @nullable
  bool get activeOrder;
  // @BuiltValueField(wireName: 'TimeStamp')
  // @nullable
  // String get timeStamp;
  @BuiltValueField(wireName: 'lastUpdateTime')
  @nullable
  DateTime get lastUpdateTime;
  @BuiltValueField(wireName: 'UserName')
  @nullable
  String get userName;
  @BuiltValueField(wireName: 'Phone1')
  @nullable
  String get phone1;
  @BuiltValueField(wireName: 'Phone2')
  @nullable
  String get phone2;
  @BuiltValueField(wireName: 'Phone3')
  @nullable
  String get phone3;

  static Serializer<Account> get serializer => _$accountSerializer;
}
