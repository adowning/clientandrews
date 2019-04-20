// GENERATED CODE - DO NOT MODIFY BY HAND

part of asset_history;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetHistory> _$assetHistorySerializer =
    new _$AssetHistorySerializer();

class _$AssetHistorySerializer implements StructuredSerializer<AssetHistory> {
  @override
  final Iterable<Type> types = const [AssetHistory, _$AssetHistory];
  @override
  final String wireName = 'AssetHistory';

  @override
  Iterable serialize(Serializers serializers, AssetHistory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'assetHistoryID',
      serializers.serialize(object.assetHistoryID,
          specifiedType: const FullType(String)),
      'employeeId',
      serializers.serialize(object.employeeId,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'assetID',
      serializers.serialize(object.assetID,
          specifiedType: const FullType(String)),
      'checkoutTime',
      serializers.serialize(object.checkoutTime,
          specifiedType: const FullType(DateTime)),
      'checkinTime',
      serializers.serialize(object.checkinTime,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  AssetHistory deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetHistoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'assetHistoryID':
          result.assetHistoryID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'employeeId':
          result.employeeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assetID':
          result.assetID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'checkoutTime':
          result.checkoutTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'checkinTime':
          result.checkinTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetHistory extends AssetHistory {
  @override
  final String assetHistoryID;
  @override
  final String employeeId;
  @override
  final String type;
  @override
  final String assetID;
  @override
  final DateTime checkoutTime;
  @override
  final DateTime checkinTime;

  factory _$AssetHistory([void Function(AssetHistoryBuilder) updates]) =>
      (new AssetHistoryBuilder()..update(updates)).build();

  _$AssetHistory._(
      {this.assetHistoryID,
      this.employeeId,
      this.type,
      this.assetID,
      this.checkoutTime,
      this.checkinTime})
      : super._() {
    if (assetHistoryID == null) {
      throw new BuiltValueNullFieldError('AssetHistory', 'assetHistoryID');
    }
    if (employeeId == null) {
      throw new BuiltValueNullFieldError('AssetHistory', 'employeeId');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('AssetHistory', 'type');
    }
    if (assetID == null) {
      throw new BuiltValueNullFieldError('AssetHistory', 'assetID');
    }
    if (checkoutTime == null) {
      throw new BuiltValueNullFieldError('AssetHistory', 'checkoutTime');
    }
    if (checkinTime == null) {
      throw new BuiltValueNullFieldError('AssetHistory', 'checkinTime');
    }
  }

  @override
  AssetHistory rebuild(void Function(AssetHistoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetHistoryBuilder toBuilder() => new AssetHistoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetHistory &&
        assetHistoryID == other.assetHistoryID &&
        employeeId == other.employeeId &&
        type == other.type &&
        assetID == other.assetID &&
        checkoutTime == other.checkoutTime &&
        checkinTime == other.checkinTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, assetHistoryID.hashCode), employeeId.hashCode),
                    type.hashCode),
                assetID.hashCode),
            checkoutTime.hashCode),
        checkinTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetHistory')
          ..add('assetHistoryID', assetHistoryID)
          ..add('employeeId', employeeId)
          ..add('type', type)
          ..add('assetID', assetID)
          ..add('checkoutTime', checkoutTime)
          ..add('checkinTime', checkinTime))
        .toString();
  }
}

class AssetHistoryBuilder
    implements Builder<AssetHistory, AssetHistoryBuilder> {
  _$AssetHistory _$v;

  String _assetHistoryID;
  String get assetHistoryID => _$this._assetHistoryID;
  set assetHistoryID(String assetHistoryID) =>
      _$this._assetHistoryID = assetHistoryID;

  String _employeeId;
  String get employeeId => _$this._employeeId;
  set employeeId(String employeeId) => _$this._employeeId = employeeId;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _assetID;
  String get assetID => _$this._assetID;
  set assetID(String assetID) => _$this._assetID = assetID;

  DateTime _checkoutTime;
  DateTime get checkoutTime => _$this._checkoutTime;
  set checkoutTime(DateTime checkoutTime) =>
      _$this._checkoutTime = checkoutTime;

  DateTime _checkinTime;
  DateTime get checkinTime => _$this._checkinTime;
  set checkinTime(DateTime checkinTime) => _$this._checkinTime = checkinTime;

  AssetHistoryBuilder();

  AssetHistoryBuilder get _$this {
    if (_$v != null) {
      _assetHistoryID = _$v.assetHistoryID;
      _employeeId = _$v.employeeId;
      _type = _$v.type;
      _assetID = _$v.assetID;
      _checkoutTime = _$v.checkoutTime;
      _checkinTime = _$v.checkinTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetHistory other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssetHistory;
  }

  @override
  void update(void Function(AssetHistoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetHistory build() {
    final _$result = _$v ??
        new _$AssetHistory._(
            assetHistoryID: assetHistoryID,
            employeeId: employeeId,
            type: type,
            assetID: assetID,
            checkoutTime: checkoutTime,
            checkinTime: checkinTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
