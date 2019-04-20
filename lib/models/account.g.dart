// GENERATED CODE - DO NOT MODIFY BY HAND

part of account;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Account> _$accountSerializer = new _$AccountSerializer();

class _$AccountSerializer implements StructuredSerializer<Account> {
  @override
  final Iterable<Type> types = const [Account, _$Account];
  @override
  final String wireName = 'Account';

  @override
  Iterable serialize(Serializers serializers, Account object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.accountID != null) {
      result
        ..add('accountID')
        ..add(serializers.serialize(object.accountID,
            specifiedType: const FullType(String)));
    }
    if (object.accountName != null) {
      result
        ..add('AccountName')
        ..add(serializers.serialize(object.accountName,
            specifiedType: const FullType(String)));
    }
    if (object.accountType != null) {
      result
        ..add('AccountType')
        ..add(serializers.serialize(object.accountType,
            specifiedType: const FullType(String)));
    }
    if (object.address1 != null) {
      result
        ..add('Address1')
        ..add(serializers.serialize(object.address1,
            specifiedType: const FullType(String)));
    }
    if (object.alert != null) {
      result
        ..add('Alert')
        ..add(serializers.serialize(object.alert,
            specifiedType: const FullType(bool)));
    }
    if (object.city != null) {
      result
        ..add('City')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.companyID != null) {
      result
        ..add('CompanyID')
        ..add(serializers.serialize(object.companyID,
            specifiedType: const FullType(String)));
    }
    if (object.companyName != null) {
      result
        ..add('CompanyName')
        ..add(serializers.serialize(object.companyName,
            specifiedType: const FullType(String)));
    }
    if (object.country != null) {
      result
        ..add('Country')
        ..add(serializers.serialize(object.country,
            specifiedType: const FullType(String)));
    }
    if (object.county != null) {
      result
        ..add('County')
        ..add(serializers.serialize(object.county,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('Email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.firstName != null) {
      result
        ..add('FirstName')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.lastName != null) {
      result
        ..add('LastName')
        ..add(serializers.serialize(object.lastName,
            specifiedType: const FullType(String)));
    }
    if (object.leadSourceID != null) {
      result
        ..add('LeadSourceID')
        ..add(serializers.serialize(object.leadSourceID,
            specifiedType: const FullType(String)));
    }
    if (object.state != null) {
      result
        ..add('State')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(String)));
    }
    if (object.notes != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(object.notes,
            specifiedType: const FullType(String)));
    }
    if (object.zip != null) {
      result
        ..add('Zip')
        ..add(serializers.serialize(object.zip,
            specifiedType: const FullType(int)));
    }
    if (object.activeOrder != null) {
      result
        ..add('ActiveOrder')
        ..add(serializers.serialize(object.activeOrder,
            specifiedType: const FullType(bool)));
    }
    if (object.lastUpdateTime != null) {
      result
        ..add('lastUpdateTime')
        ..add(serializers.serialize(object.lastUpdateTime,
            specifiedType: const FullType(DateTime)));
    }
    if (object.userName != null) {
      result
        ..add('UserName')
        ..add(serializers.serialize(object.userName,
            specifiedType: const FullType(String)));
    }
    if (object.phone1 != null) {
      result
        ..add('Phone1')
        ..add(serializers.serialize(object.phone1,
            specifiedType: const FullType(String)));
    }
    if (object.phone2 != null) {
      result
        ..add('Phone2')
        ..add(serializers.serialize(object.phone2,
            specifiedType: const FullType(String)));
    }
    if (object.phone3 != null) {
      result
        ..add('Phone3')
        ..add(serializers.serialize(object.phone3,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Account deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'accountID':
          result.accountID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'AccountName':
          result.accountName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'AccountType':
          result.accountType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Address1':
          result.address1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Alert':
          result.alert = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'City':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'CompanyID':
          result.companyID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'CompanyName':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'County':
          result.county = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'FirstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'LastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'LeadSourceID':
          result.leadSourceID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'State':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Zip':
          result.zip = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'ActiveOrder':
          result.activeOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lastUpdateTime':
          result.lastUpdateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'UserName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Phone1':
          result.phone1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Phone2':
          result.phone2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Phone3':
          result.phone3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Account extends Account {
  @override
  final String accountID;
  @override
  final String accountName;
  @override
  final String accountType;
  @override
  final String address1;
  @override
  final bool alert;
  @override
  final String city;
  @override
  final String companyID;
  @override
  final String companyName;
  @override
  final String country;
  @override
  final String county;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String leadSourceID;
  @override
  final String state;
  @override
  final String notes;
  @override
  final int zip;
  @override
  final bool activeOrder;
  @override
  final DateTime lastUpdateTime;
  @override
  final String userName;
  @override
  final String phone1;
  @override
  final String phone2;
  @override
  final String phone3;

  factory _$Account([void Function(AccountBuilder) updates]) =>
      (new AccountBuilder()..update(updates)).build();

  _$Account._(
      {this.accountID,
      this.accountName,
      this.accountType,
      this.address1,
      this.alert,
      this.city,
      this.companyID,
      this.companyName,
      this.country,
      this.county,
      this.email,
      this.firstName,
      this.lastName,
      this.leadSourceID,
      this.state,
      this.notes,
      this.zip,
      this.activeOrder,
      this.lastUpdateTime,
      this.userName,
      this.phone1,
      this.phone2,
      this.phone3})
      : super._();

  @override
  Account rebuild(void Function(AccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountBuilder toBuilder() => new AccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Account &&
        accountID == other.accountID &&
        accountName == other.accountName &&
        accountType == other.accountType &&
        address1 == other.address1 &&
        alert == other.alert &&
        city == other.city &&
        companyID == other.companyID &&
        companyName == other.companyName &&
        country == other.country &&
        county == other.county &&
        email == other.email &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        leadSourceID == other.leadSourceID &&
        state == other.state &&
        notes == other.notes &&
        zip == other.zip &&
        activeOrder == other.activeOrder &&
        lastUpdateTime == other.lastUpdateTime &&
        userName == other.userName &&
        phone1 == other.phone1 &&
        phone2 == other.phone2 &&
        phone3 == other.phone3;
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
                                                                            $jc($jc($jc($jc($jc(0, accountID.hashCode), accountName.hashCode), accountType.hashCode), address1.hashCode),
                                                                                alert.hashCode),
                                                                            city.hashCode),
                                                                        companyID.hashCode),
                                                                    companyName.hashCode),
                                                                country.hashCode),
                                                            county.hashCode),
                                                        email.hashCode),
                                                    firstName.hashCode),
                                                lastName.hashCode),
                                            leadSourceID.hashCode),
                                        state.hashCode),
                                    notes.hashCode),
                                zip.hashCode),
                            activeOrder.hashCode),
                        lastUpdateTime.hashCode),
                    userName.hashCode),
                phone1.hashCode),
            phone2.hashCode),
        phone3.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Account')
          ..add('accountID', accountID)
          ..add('accountName', accountName)
          ..add('accountType', accountType)
          ..add('address1', address1)
          ..add('alert', alert)
          ..add('city', city)
          ..add('companyID', companyID)
          ..add('companyName', companyName)
          ..add('country', country)
          ..add('county', county)
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('leadSourceID', leadSourceID)
          ..add('state', state)
          ..add('notes', notes)
          ..add('zip', zip)
          ..add('activeOrder', activeOrder)
          ..add('lastUpdateTime', lastUpdateTime)
          ..add('userName', userName)
          ..add('phone1', phone1)
          ..add('phone2', phone2)
          ..add('phone3', phone3))
        .toString();
  }
}

class AccountBuilder implements Builder<Account, AccountBuilder> {
  _$Account _$v;

  String _accountID;
  String get accountID => _$this._accountID;
  set accountID(String accountID) => _$this._accountID = accountID;

  String _accountName;
  String get accountName => _$this._accountName;
  set accountName(String accountName) => _$this._accountName = accountName;

  String _accountType;
  String get accountType => _$this._accountType;
  set accountType(String accountType) => _$this._accountType = accountType;

  String _address1;
  String get address1 => _$this._address1;
  set address1(String address1) => _$this._address1 = address1;

  bool _alert;
  bool get alert => _$this._alert;
  set alert(bool alert) => _$this._alert = alert;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _companyID;
  String get companyID => _$this._companyID;
  set companyID(String companyID) => _$this._companyID = companyID;

  String _companyName;
  String get companyName => _$this._companyName;
  set companyName(String companyName) => _$this._companyName = companyName;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _county;
  String get county => _$this._county;
  set county(String county) => _$this._county = county;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _leadSourceID;
  String get leadSourceID => _$this._leadSourceID;
  set leadSourceID(String leadSourceID) => _$this._leadSourceID = leadSourceID;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  String _notes;
  String get notes => _$this._notes;
  set notes(String notes) => _$this._notes = notes;

  int _zip;
  int get zip => _$this._zip;
  set zip(int zip) => _$this._zip = zip;

  bool _activeOrder;
  bool get activeOrder => _$this._activeOrder;
  set activeOrder(bool activeOrder) => _$this._activeOrder = activeOrder;

  DateTime _lastUpdateTime;
  DateTime get lastUpdateTime => _$this._lastUpdateTime;
  set lastUpdateTime(DateTime lastUpdateTime) =>
      _$this._lastUpdateTime = lastUpdateTime;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  String _phone1;
  String get phone1 => _$this._phone1;
  set phone1(String phone1) => _$this._phone1 = phone1;

  String _phone2;
  String get phone2 => _$this._phone2;
  set phone2(String phone2) => _$this._phone2 = phone2;

  String _phone3;
  String get phone3 => _$this._phone3;
  set phone3(String phone3) => _$this._phone3 = phone3;

  AccountBuilder();

  AccountBuilder get _$this {
    if (_$v != null) {
      _accountID = _$v.accountID;
      _accountName = _$v.accountName;
      _accountType = _$v.accountType;
      _address1 = _$v.address1;
      _alert = _$v.alert;
      _city = _$v.city;
      _companyID = _$v.companyID;
      _companyName = _$v.companyName;
      _country = _$v.country;
      _county = _$v.county;
      _email = _$v.email;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _leadSourceID = _$v.leadSourceID;
      _state = _$v.state;
      _notes = _$v.notes;
      _zip = _$v.zip;
      _activeOrder = _$v.activeOrder;
      _lastUpdateTime = _$v.lastUpdateTime;
      _userName = _$v.userName;
      _phone1 = _$v.phone1;
      _phone2 = _$v.phone2;
      _phone3 = _$v.phone3;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Account other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Account;
  }

  @override
  void update(void Function(AccountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Account build() {
    final _$result = _$v ??
        new _$Account._(
            accountID: accountID,
            accountName: accountName,
            accountType: accountType,
            address1: address1,
            alert: alert,
            city: city,
            companyID: companyID,
            companyName: companyName,
            country: country,
            county: county,
            email: email,
            firstName: firstName,
            lastName: lastName,
            leadSourceID: leadSourceID,
            state: state,
            notes: notes,
            zip: zip,
            activeOrder: activeOrder,
            lastUpdateTime: lastUpdateTime,
            userName: userName,
            phone1: phone1,
            phone2: phone2,
            phone3: phone3);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
