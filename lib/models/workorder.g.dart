// GENERATED CODE - DO NOT MODIFY BY HAND

part of workorder;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Workorder> _$workorderSerializer = new _$WorkorderSerializer();

class _$WorkorderSerializer implements StructuredSerializer<Workorder> {
  @override
  final Iterable<Type> types = const [Workorder, _$Workorder];
  @override
  final String wireName = 'Workorder';

  @override
  Iterable serialize(Serializers serializers, Workorder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'orderID',
      serializers.serialize(object.orderID,
          specifiedType: const FullType(String)),
      'accountID',
      serializers.serialize(object.accountID,
          specifiedType: const FullType(String)),
      'accountName',
      serializers.serialize(object.accountName,
          specifiedType: const FullType(String)),
      'correction',
      serializers.serialize(object.correction,
          specifiedType: const FullType(double)),
      'createdBy',
      serializers.serialize(object.createdBy,
          specifiedType: const FullType(String)),
      'createdOn',
      serializers.serialize(object.createdOn,
          specifiedType: const FullType(DateTime)),
      'dateCreated',
      serializers.serialize(object.dateCreated,
          specifiedType: const FullType(DateTime)),
      'discountPercent',
      serializers.serialize(object.discountPercent,
          specifiedType: const FullType(double)),
      'balanceDue',
      serializers.serialize(object.balanceDue,
          specifiedType: const FullType(double)),
      'dueDate',
      serializers.serialize(object.dueDate,
          specifiedType: const FullType(DateTime)),
      'flagForReview',
      serializers.serialize(object.flagForReview,
          specifiedType: const FullType(bool)),
      'grandTotal',
      serializers.serialize(object.grandTotal,
          specifiedType: const FullType(double)),
      'tipCollected',
      serializers.serialize(object.tipCollected,
          specifiedType: const FullType(double)),
      'group',
      serializers.serialize(object.group,
          specifiedType: const FullType(String)),
      'orderType',
      serializers.serialize(object.orderType,
          specifiedType: const FullType(String)),
      'originalType',
      serializers.serialize(object.originalType,
          specifiedType: const FullType(String)),
      'postToAccounting',
      serializers.serialize(object.postToAccounting,
          specifiedType: const FullType(bool)),
      'printStyleID',
      serializers.serialize(object.printStyleID,
          specifiedType: const FullType(String)),
      'siteID',
      serializers.serialize(object.siteID,
          specifiedType: const FullType(String)),
      'subTotal',
      serializers.serialize(object.subTotal,
          specifiedType: const FullType(double)),
      'taxID',
      serializers.serialize(object.taxID,
          specifiedType: const FullType(String)),
      'taxRate',
      serializers.serialize(object.taxRate,
          specifiedType: const FullType(double)),
      'timeStamp',
      serializers.serialize(object.timeStamp,
          specifiedType: const FullType(DateTime)),
      'taxTotal',
      serializers.serialize(object.taxTotal,
          specifiedType: const FullType(double)),
      'userName',
      serializers.serialize(object.userName,
          specifiedType: const FullType(String)),
      'merchantFeesTotal',
      serializers.serialize(object.merchantFeesTotal,
          specifiedType: const FullType(double)),
      'needsDelivered',
      serializers.serialize(object.needsDelivered,
          specifiedType: const FullType(bool)),
      'notes',
      serializers.serialize(object.notes,
          specifiedType: const FullType(String)),
      'serviceType',
      serializers.serialize(object.serviceType,
          specifiedType: const FullType(String)),
    ];
    if (object.address1 != null) {
      result
        ..add('address1')
        ..add(serializers.serialize(object.address1,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(String)));
    }
    if (object.zip != null) {
      result
        ..add('zip')
        ..add(serializers.serialize(object.zip,
            specifiedType: const FullType(String)));
    }
    if (object.companyID != null) {
      result
        ..add('companyID')
        ..add(serializers.serialize(object.companyID,
            specifiedType: const FullType(String)));
    }
    if (object.dateCompleted != null) {
      result
        ..add('dateCompleted')
        ..add(serializers.serialize(object.dateCompleted,
            specifiedType: const FullType(DateTime)));
    }
    if (object.orderNumber != null) {
      result
        ..add('orderNumber')
        ..add(serializers.serialize(object.orderNumber,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  Workorder deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkorderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'orderID':
          result.orderID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accountID':
          result.accountID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accountName':
          result.accountName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address1':
          result.address1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'zip':
          result.zip = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'companyID':
          result.companyID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'correction':
          result.correction = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'createdBy':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdOn':
          result.createdOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'dateCompleted':
          result.dateCompleted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'dateCreated':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'discountPercent':
          result.discountPercent = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'balanceDue':
          result.balanceDue = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'dueDate':
          result.dueDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'flagForReview':
          result.flagForReview = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'grandTotal':
          result.grandTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'tipCollected':
          result.tipCollected = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderNumber':
          result.orderNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'orderType':
          result.orderType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'originalType':
          result.originalType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postToAccounting':
          result.postToAccounting = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'printStyleID':
          result.printStyleID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'siteID':
          result.siteID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subTotal':
          result.subTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'taxID':
          result.taxID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'taxRate':
          result.taxRate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'timeStamp':
          result.timeStamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'taxTotal':
          result.taxTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'merchantFeesTotal':
          result.merchantFeesTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'needsDelivered':
          result.needsDelivered = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'serviceType':
          result.serviceType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Workorder extends Workorder {
  @override
  final String orderID;
  @override
  final String accountID;
  @override
  final String accountName;
  @override
  final String address1;
  @override
  final String city;
  @override
  final String state;
  @override
  final String zip;
  @override
  final String companyID;
  @override
  final double correction;
  @override
  final String createdBy;
  @override
  final DateTime createdOn;
  @override
  final DateTime dateCompleted;
  @override
  final DateTime dateCreated;
  @override
  final double discountPercent;
  @override
  final double balanceDue;
  @override
  final DateTime dueDate;
  @override
  final bool flagForReview;
  @override
  final double grandTotal;
  @override
  final double tipCollected;
  @override
  final String group;
  @override
  final int orderNumber;
  @override
  final String orderType;
  @override
  final String originalType;
  @override
  final bool postToAccounting;
  @override
  final String printStyleID;
  @override
  final String siteID;
  @override
  final double subTotal;
  @override
  final String taxID;
  @override
  final double taxRate;
  @override
  final DateTime timeStamp;
  @override
  final double taxTotal;
  @override
  final String userName;
  @override
  final double merchantFeesTotal;
  @override
  final bool needsDelivered;
  @override
  final String notes;
  @override
  final String serviceType;

  factory _$Workorder([void Function(WorkorderBuilder) updates]) =>
      (new WorkorderBuilder()..update(updates)).build() as _$Workorder;

  _$Workorder._(
      {this.orderID,
      this.accountID,
      this.accountName,
      this.address1,
      this.city,
      this.state,
      this.zip,
      this.companyID,
      this.correction,
      this.createdBy,
      this.createdOn,
      this.dateCompleted,
      this.dateCreated,
      this.discountPercent,
      this.balanceDue,
      this.dueDate,
      this.flagForReview,
      this.grandTotal,
      this.tipCollected,
      this.group,
      this.orderNumber,
      this.orderType,
      this.originalType,
      this.postToAccounting,
      this.printStyleID,
      this.siteID,
      this.subTotal,
      this.taxID,
      this.taxRate,
      this.timeStamp,
      this.taxTotal,
      this.userName,
      this.merchantFeesTotal,
      this.needsDelivered,
      this.notes,
      this.serviceType})
      : super._() {
    if (orderID == null) {
      throw new BuiltValueNullFieldError('Workorder', 'orderID');
    }
    if (accountID == null) {
      throw new BuiltValueNullFieldError('Workorder', 'accountID');
    }
    if (accountName == null) {
      throw new BuiltValueNullFieldError('Workorder', 'accountName');
    }
    if (correction == null) {
      throw new BuiltValueNullFieldError('Workorder', 'correction');
    }
    if (createdBy == null) {
      throw new BuiltValueNullFieldError('Workorder', 'createdBy');
    }
    if (createdOn == null) {
      throw new BuiltValueNullFieldError('Workorder', 'createdOn');
    }
    if (dateCreated == null) {
      throw new BuiltValueNullFieldError('Workorder', 'dateCreated');
    }
    if (discountPercent == null) {
      throw new BuiltValueNullFieldError('Workorder', 'discountPercent');
    }
    if (balanceDue == null) {
      throw new BuiltValueNullFieldError('Workorder', 'balanceDue');
    }
    if (dueDate == null) {
      throw new BuiltValueNullFieldError('Workorder', 'dueDate');
    }
    if (flagForReview == null) {
      throw new BuiltValueNullFieldError('Workorder', 'flagForReview');
    }
    if (grandTotal == null) {
      throw new BuiltValueNullFieldError('Workorder', 'grandTotal');
    }
    if (tipCollected == null) {
      throw new BuiltValueNullFieldError('Workorder', 'tipCollected');
    }
    if (group == null) {
      throw new BuiltValueNullFieldError('Workorder', 'group');
    }
    if (orderType == null) {
      throw new BuiltValueNullFieldError('Workorder', 'orderType');
    }
    if (originalType == null) {
      throw new BuiltValueNullFieldError('Workorder', 'originalType');
    }
    if (postToAccounting == null) {
      throw new BuiltValueNullFieldError('Workorder', 'postToAccounting');
    }
    if (printStyleID == null) {
      throw new BuiltValueNullFieldError('Workorder', 'printStyleID');
    }
    if (siteID == null) {
      throw new BuiltValueNullFieldError('Workorder', 'siteID');
    }
    if (subTotal == null) {
      throw new BuiltValueNullFieldError('Workorder', 'subTotal');
    }
    if (taxID == null) {
      throw new BuiltValueNullFieldError('Workorder', 'taxID');
    }
    if (taxRate == null) {
      throw new BuiltValueNullFieldError('Workorder', 'taxRate');
    }
    if (timeStamp == null) {
      throw new BuiltValueNullFieldError('Workorder', 'timeStamp');
    }
    if (taxTotal == null) {
      throw new BuiltValueNullFieldError('Workorder', 'taxTotal');
    }
    if (userName == null) {
      throw new BuiltValueNullFieldError('Workorder', 'userName');
    }
    if (merchantFeesTotal == null) {
      throw new BuiltValueNullFieldError('Workorder', 'merchantFeesTotal');
    }
    if (needsDelivered == null) {
      throw new BuiltValueNullFieldError('Workorder', 'needsDelivered');
    }
    if (notes == null) {
      throw new BuiltValueNullFieldError('Workorder', 'notes');
    }
    if (serviceType == null) {
      throw new BuiltValueNullFieldError('Workorder', 'serviceType');
    }
  }

  @override
  Workorder rebuild(void Function(WorkorderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$WorkorderBuilder toBuilder() => new _$WorkorderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Workorder &&
        orderID == other.orderID &&
        accountID == other.accountID &&
        accountName == other.accountName &&
        address1 == other.address1 &&
        city == other.city &&
        state == other.state &&
        zip == other.zip &&
        companyID == other.companyID &&
        correction == other.correction &&
        createdBy == other.createdBy &&
        createdOn == other.createdOn &&
        dateCompleted == other.dateCompleted &&
        dateCreated == other.dateCreated &&
        discountPercent == other.discountPercent &&
        balanceDue == other.balanceDue &&
        dueDate == other.dueDate &&
        flagForReview == other.flagForReview &&
        grandTotal == other.grandTotal &&
        tipCollected == other.tipCollected &&
        group == other.group &&
        orderNumber == other.orderNumber &&
        orderType == other.orderType &&
        originalType == other.originalType &&
        postToAccounting == other.postToAccounting &&
        printStyleID == other.printStyleID &&
        siteID == other.siteID &&
        subTotal == other.subTotal &&
        taxID == other.taxID &&
        taxRate == other.taxRate &&
        timeStamp == other.timeStamp &&
        taxTotal == other.taxTotal &&
        userName == other.userName &&
        merchantFeesTotal == other.merchantFeesTotal &&
        needsDelivered == other.needsDelivered &&
        notes == other.notes &&
        serviceType == other.serviceType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, orderID.hashCode), accountID.hashCode), accountName.hashCode), address1.hashCode), city.hashCode), state.hashCode), zip.hashCode), companyID.hashCode), correction.hashCode), createdBy.hashCode), createdOn.hashCode), dateCompleted.hashCode), dateCreated.hashCode), discountPercent.hashCode), balanceDue.hashCode), dueDate.hashCode), flagForReview.hashCode),
                                                                                grandTotal.hashCode),
                                                                            tipCollected.hashCode),
                                                                        group.hashCode),
                                                                    orderNumber.hashCode),
                                                                orderType.hashCode),
                                                            originalType.hashCode),
                                                        postToAccounting.hashCode),
                                                    printStyleID.hashCode),
                                                siteID.hashCode),
                                            subTotal.hashCode),
                                        taxID.hashCode),
                                    taxRate.hashCode),
                                timeStamp.hashCode),
                            taxTotal.hashCode),
                        userName.hashCode),
                    merchantFeesTotal.hashCode),
                needsDelivered.hashCode),
            notes.hashCode),
        serviceType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Workorder')
          ..add('orderID', orderID)
          ..add('accountID', accountID)
          ..add('accountName', accountName)
          ..add('address1', address1)
          ..add('city', city)
          ..add('state', state)
          ..add('zip', zip)
          ..add('companyID', companyID)
          ..add('correction', correction)
          ..add('createdBy', createdBy)
          ..add('createdOn', createdOn)
          ..add('dateCompleted', dateCompleted)
          ..add('dateCreated', dateCreated)
          ..add('discountPercent', discountPercent)
          ..add('balanceDue', balanceDue)
          ..add('dueDate', dueDate)
          ..add('flagForReview', flagForReview)
          ..add('grandTotal', grandTotal)
          ..add('tipCollected', tipCollected)
          ..add('group', group)
          ..add('orderNumber', orderNumber)
          ..add('orderType', orderType)
          ..add('originalType', originalType)
          ..add('postToAccounting', postToAccounting)
          ..add('printStyleID', printStyleID)
          ..add('siteID', siteID)
          ..add('subTotal', subTotal)
          ..add('taxID', taxID)
          ..add('taxRate', taxRate)
          ..add('timeStamp', timeStamp)
          ..add('taxTotal', taxTotal)
          ..add('userName', userName)
          ..add('merchantFeesTotal', merchantFeesTotal)
          ..add('needsDelivered', needsDelivered)
          ..add('notes', notes)
          ..add('serviceType', serviceType))
        .toString();
  }
}

class _$WorkorderBuilder extends WorkorderBuilder {
  _$Workorder _$v;

  @override
  String get orderID {
    _$this;
    return super.orderID;
  }

  @override
  set orderID(String orderID) {
    _$this;
    super.orderID = orderID;
  }

  @override
  String get accountID {
    _$this;
    return super.accountID;
  }

  @override
  set accountID(String accountID) {
    _$this;
    super.accountID = accountID;
  }

  @override
  String get accountName {
    _$this;
    return super.accountName;
  }

  @override
  set accountName(String accountName) {
    _$this;
    super.accountName = accountName;
  }

  @override
  String get address1 {
    _$this;
    return super.address1;
  }

  @override
  set address1(String address1) {
    _$this;
    super.address1 = address1;
  }

  @override
  String get city {
    _$this;
    return super.city;
  }

  @override
  set city(String city) {
    _$this;
    super.city = city;
  }

  @override
  String get state {
    _$this;
    return super.state;
  }

  @override
  set state(String state) {
    _$this;
    super.state = state;
  }

  @override
  String get zip {
    _$this;
    return super.zip;
  }

  @override
  set zip(String zip) {
    _$this;
    super.zip = zip;
  }

  @override
  String get companyID {
    _$this;
    return super.companyID;
  }

  @override
  set companyID(String companyID) {
    _$this;
    super.companyID = companyID;
  }

  @override
  double get correction {
    _$this;
    return super.correction;
  }

  @override
  set correction(double correction) {
    _$this;
    super.correction = correction;
  }

  @override
  String get createdBy {
    _$this;
    return super.createdBy;
  }

  @override
  set createdBy(String createdBy) {
    _$this;
    super.createdBy = createdBy;
  }

  @override
  DateTime get createdOn {
    _$this;
    return super.createdOn;
  }

  @override
  set createdOn(DateTime createdOn) {
    _$this;
    super.createdOn = createdOn;
  }

  @override
  DateTime get dateCompleted {
    _$this;
    return super.dateCompleted;
  }

  @override
  set dateCompleted(DateTime dateCompleted) {
    _$this;
    super.dateCompleted = dateCompleted;
  }

  @override
  DateTime get dateCreated {
    _$this;
    return super.dateCreated;
  }

  @override
  set dateCreated(DateTime dateCreated) {
    _$this;
    super.dateCreated = dateCreated;
  }

  @override
  double get discountPercent {
    _$this;
    return super.discountPercent;
  }

  @override
  set discountPercent(double discountPercent) {
    _$this;
    super.discountPercent = discountPercent;
  }

  @override
  double get balanceDue {
    _$this;
    return super.balanceDue;
  }

  @override
  set balanceDue(double balanceDue) {
    _$this;
    super.balanceDue = balanceDue;
  }

  @override
  DateTime get dueDate {
    _$this;
    return super.dueDate;
  }

  @override
  set dueDate(DateTime dueDate) {
    _$this;
    super.dueDate = dueDate;
  }

  @override
  bool get flagForReview {
    _$this;
    return super.flagForReview;
  }

  @override
  set flagForReview(bool flagForReview) {
    _$this;
    super.flagForReview = flagForReview;
  }

  @override
  double get grandTotal {
    _$this;
    return super.grandTotal;
  }

  @override
  set grandTotal(double grandTotal) {
    _$this;
    super.grandTotal = grandTotal;
  }

  @override
  double get tipCollected {
    _$this;
    return super.tipCollected;
  }

  @override
  set tipCollected(double tipCollected) {
    _$this;
    super.tipCollected = tipCollected;
  }

  @override
  String get group {
    _$this;
    return super.group;
  }

  @override
  set group(String group) {
    _$this;
    super.group = group;
  }

  @override
  int get orderNumber {
    _$this;
    return super.orderNumber;
  }

  @override
  set orderNumber(int orderNumber) {
    _$this;
    super.orderNumber = orderNumber;
  }

  @override
  String get orderType {
    _$this;
    return super.orderType;
  }

  @override
  set orderType(String orderType) {
    _$this;
    super.orderType = orderType;
  }

  @override
  String get originalType {
    _$this;
    return super.originalType;
  }

  @override
  set originalType(String originalType) {
    _$this;
    super.originalType = originalType;
  }

  @override
  bool get postToAccounting {
    _$this;
    return super.postToAccounting;
  }

  @override
  set postToAccounting(bool postToAccounting) {
    _$this;
    super.postToAccounting = postToAccounting;
  }

  @override
  String get printStyleID {
    _$this;
    return super.printStyleID;
  }

  @override
  set printStyleID(String printStyleID) {
    _$this;
    super.printStyleID = printStyleID;
  }

  @override
  String get siteID {
    _$this;
    return super.siteID;
  }

  @override
  set siteID(String siteID) {
    _$this;
    super.siteID = siteID;
  }

  @override
  double get subTotal {
    _$this;
    return super.subTotal;
  }

  @override
  set subTotal(double subTotal) {
    _$this;
    super.subTotal = subTotal;
  }

  @override
  String get taxID {
    _$this;
    return super.taxID;
  }

  @override
  set taxID(String taxID) {
    _$this;
    super.taxID = taxID;
  }

  @override
  double get taxRate {
    _$this;
    return super.taxRate;
  }

  @override
  set taxRate(double taxRate) {
    _$this;
    super.taxRate = taxRate;
  }

  @override
  DateTime get timeStamp {
    _$this;
    return super.timeStamp;
  }

  @override
  set timeStamp(DateTime timeStamp) {
    _$this;
    super.timeStamp = timeStamp;
  }

  @override
  double get taxTotal {
    _$this;
    return super.taxTotal;
  }

  @override
  set taxTotal(double taxTotal) {
    _$this;
    super.taxTotal = taxTotal;
  }

  @override
  String get userName {
    _$this;
    return super.userName;
  }

  @override
  set userName(String userName) {
    _$this;
    super.userName = userName;
  }

  @override
  double get merchantFeesTotal {
    _$this;
    return super.merchantFeesTotal;
  }

  @override
  set merchantFeesTotal(double merchantFeesTotal) {
    _$this;
    super.merchantFeesTotal = merchantFeesTotal;
  }

  @override
  bool get needsDelivered {
    _$this;
    return super.needsDelivered;
  }

  @override
  set needsDelivered(bool needsDelivered) {
    _$this;
    super.needsDelivered = needsDelivered;
  }

  @override
  String get notes {
    _$this;
    return super.notes;
  }

  @override
  set notes(String notes) {
    _$this;
    super.notes = notes;
  }

  @override
  String get serviceType {
    _$this;
    return super.serviceType;
  }

  @override
  set serviceType(String serviceType) {
    _$this;
    super.serviceType = serviceType;
  }

  _$WorkorderBuilder() : super._();

  WorkorderBuilder get _$this {
    if (_$v != null) {
      super.orderID = _$v.orderID;
      super.accountID = _$v.accountID;
      super.accountName = _$v.accountName;
      super.address1 = _$v.address1;
      super.city = _$v.city;
      super.state = _$v.state;
      super.zip = _$v.zip;
      super.companyID = _$v.companyID;
      super.correction = _$v.correction;
      super.createdBy = _$v.createdBy;
      super.createdOn = _$v.createdOn;
      super.dateCompleted = _$v.dateCompleted;
      super.dateCreated = _$v.dateCreated;
      super.discountPercent = _$v.discountPercent;
      super.balanceDue = _$v.balanceDue;
      super.dueDate = _$v.dueDate;
      super.flagForReview = _$v.flagForReview;
      super.grandTotal = _$v.grandTotal;
      super.tipCollected = _$v.tipCollected;
      super.group = _$v.group;
      super.orderNumber = _$v.orderNumber;
      super.orderType = _$v.orderType;
      super.originalType = _$v.originalType;
      super.postToAccounting = _$v.postToAccounting;
      super.printStyleID = _$v.printStyleID;
      super.siteID = _$v.siteID;
      super.subTotal = _$v.subTotal;
      super.taxID = _$v.taxID;
      super.taxRate = _$v.taxRate;
      super.timeStamp = _$v.timeStamp;
      super.taxTotal = _$v.taxTotal;
      super.userName = _$v.userName;
      super.merchantFeesTotal = _$v.merchantFeesTotal;
      super.needsDelivered = _$v.needsDelivered;
      super.notes = _$v.notes;
      super.serviceType = _$v.serviceType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Workorder other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Workorder;
  }

  @override
  void update(void Function(WorkorderBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Workorder build() {
    final _$result = _$v ??
        new _$Workorder._(
            orderID: orderID,
            accountID: accountID,
            accountName: accountName,
            address1: address1,
            city: city,
            state: state,
            zip: zip,
            companyID: companyID,
            correction: correction,
            createdBy: createdBy,
            createdOn: createdOn,
            dateCompleted: dateCompleted,
            dateCreated: dateCreated,
            discountPercent: discountPercent,
            balanceDue: balanceDue,
            dueDate: dueDate,
            flagForReview: flagForReview,
            grandTotal: grandTotal,
            tipCollected: tipCollected,
            group: group,
            orderNumber: orderNumber,
            orderType: orderType,
            originalType: originalType,
            postToAccounting: postToAccounting,
            printStyleID: printStyleID,
            siteID: siteID,
            subTotal: subTotal,
            taxID: taxID,
            taxRate: taxRate,
            timeStamp: timeStamp,
            taxTotal: taxTotal,
            userName: userName,
            merchantFeesTotal: merchantFeesTotal,
            needsDelivered: needsDelivered,
            notes: notes,
            serviceType: serviceType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
