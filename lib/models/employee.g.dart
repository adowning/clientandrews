// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Employee> _$employeeSerializer = new _$EmployeeSerializer();

class _$EmployeeSerializer implements StructuredSerializer<Employee> {
  @override
  final Iterable<Type> types = const [Employee, _$Employee];
  @override
  final String wireName = 'Employee';

  @override
  Iterable serialize(Serializers serializers, Employee object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    if (object.fullName != null) {
      result
        ..add('fullName')
        ..add(serializers.serialize(object.fullName,
            specifiedType: const FullType(String)));
    }
    if (object.firstname != null) {
      result
        ..add('firstname')
        ..add(serializers.serialize(object.firstname,
            specifiedType: const FullType(String)));
    }
    if (object.isOwner != null) {
      result
        ..add('isOwner')
        ..add(serializers.serialize(object.isOwner,
            specifiedType: const FullType(bool)));
    }
    if (object.currentTimesheetId != null) {
      result
        ..add('currentTimesheetId')
        ..add(serializers.serialize(object.currentTimesheetId,
            specifiedType: const FullType(String)));
    }
    if (object.cellPhone != null) {
      result
        ..add('cellPhone')
        ..add(serializers.serialize(object.cellPhone,
            specifiedType: const FullType(String)));
    }
    if (object.avatarLarge != null) {
      result
        ..add('avatarLarge')
        ..add(serializers.serialize(object.avatarLarge,
            specifiedType: const FullType(String)));
    }
    if (object.inTimeStamp != null) {
      result
        ..add('inTimeStamp')
        ..add(serializers.serialize(object.inTimeStamp,
            specifiedType: const FullType(DateTime)));
    }
    if (object.workStartDate != null) {
      result
        ..add('workStartDate')
        ..add(serializers.serialize(object.workStartDate,
            specifiedType: const FullType(String)));
    }
    if (object.timesheetId != null) {
      result
        ..add('timesheetId')
        ..add(serializers.serialize(object.timesheetId,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Employee deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmployeeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fullName':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firstname':
          result.firstname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isOwner':
          result.isOwner = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'currentTimesheetId':
          result.currentTimesheetId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cellPhone':
          result.cellPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatarLarge':
          result.avatarLarge = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'inTimeStamp':
          result.inTimeStamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'workStartDate':
          result.workStartDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timesheetId':
          result.timesheetId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Employee extends Employee {
  @override
  final String id;
  @override
  final String fullName;
  @override
  final String firstname;
  @override
  final bool isOwner;
  @override
  final String currentTimesheetId;
  @override
  final String cellPhone;
  @override
  final String avatarLarge;
  @override
  final DateTime inTimeStamp;
  @override
  final String workStartDate;
  @override
  final String timesheetId;

  factory _$Employee([void Function(EmployeeBuilder) updates]) =>
      (new EmployeeBuilder()..update(updates)).build();

  _$Employee._(
      {this.id,
      this.fullName,
      this.firstname,
      this.isOwner,
      this.currentTimesheetId,
      this.cellPhone,
      this.avatarLarge,
      this.inTimeStamp,
      this.workStartDate,
      this.timesheetId})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Employee', 'id');
    }
  }

  @override
  Employee rebuild(void Function(EmployeeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeeBuilder toBuilder() => new EmployeeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Employee &&
        id == other.id &&
        fullName == other.fullName &&
        firstname == other.firstname &&
        isOwner == other.isOwner &&
        currentTimesheetId == other.currentTimesheetId &&
        cellPhone == other.cellPhone &&
        avatarLarge == other.avatarLarge &&
        inTimeStamp == other.inTimeStamp &&
        workStartDate == other.workStartDate &&
        timesheetId == other.timesheetId;
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
                                $jc($jc($jc(0, id.hashCode), fullName.hashCode),
                                    firstname.hashCode),
                                isOwner.hashCode),
                            currentTimesheetId.hashCode),
                        cellPhone.hashCode),
                    avatarLarge.hashCode),
                inTimeStamp.hashCode),
            workStartDate.hashCode),
        timesheetId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Employee')
          ..add('id', id)
          ..add('fullName', fullName)
          ..add('firstname', firstname)
          ..add('isOwner', isOwner)
          ..add('currentTimesheetId', currentTimesheetId)
          ..add('cellPhone', cellPhone)
          ..add('avatarLarge', avatarLarge)
          ..add('inTimeStamp', inTimeStamp)
          ..add('workStartDate', workStartDate)
          ..add('timesheetId', timesheetId))
        .toString();
  }
}

class EmployeeBuilder implements Builder<Employee, EmployeeBuilder> {
  _$Employee _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _fullName;
  String get fullName => _$this._fullName;
  set fullName(String fullName) => _$this._fullName = fullName;

  String _firstname;
  String get firstname => _$this._firstname;
  set firstname(String firstname) => _$this._firstname = firstname;

  bool _isOwner;
  bool get isOwner => _$this._isOwner;
  set isOwner(bool isOwner) => _$this._isOwner = isOwner;

  String _currentTimesheetId;
  String get currentTimesheetId => _$this._currentTimesheetId;
  set currentTimesheetId(String currentTimesheetId) =>
      _$this._currentTimesheetId = currentTimesheetId;

  String _cellPhone;
  String get cellPhone => _$this._cellPhone;
  set cellPhone(String cellPhone) => _$this._cellPhone = cellPhone;

  String _avatarLarge;
  String get avatarLarge => _$this._avatarLarge;
  set avatarLarge(String avatarLarge) => _$this._avatarLarge = avatarLarge;

  DateTime _inTimeStamp;
  DateTime get inTimeStamp => _$this._inTimeStamp;
  set inTimeStamp(DateTime inTimeStamp) => _$this._inTimeStamp = inTimeStamp;

  String _workStartDate;
  String get workStartDate => _$this._workStartDate;
  set workStartDate(String workStartDate) =>
      _$this._workStartDate = workStartDate;

  String _timesheetId;
  String get timesheetId => _$this._timesheetId;
  set timesheetId(String timesheetId) => _$this._timesheetId = timesheetId;

  EmployeeBuilder();

  EmployeeBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _fullName = _$v.fullName;
      _firstname = _$v.firstname;
      _isOwner = _$v.isOwner;
      _currentTimesheetId = _$v.currentTimesheetId;
      _cellPhone = _$v.cellPhone;
      _avatarLarge = _$v.avatarLarge;
      _inTimeStamp = _$v.inTimeStamp;
      _workStartDate = _$v.workStartDate;
      _timesheetId = _$v.timesheetId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Employee other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Employee;
  }

  @override
  void update(void Function(EmployeeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Employee build() {
    final _$result = _$v ??
        new _$Employee._(
            id: id,
            fullName: fullName,
            firstname: firstname,
            isOwner: isOwner,
            currentTimesheetId: currentTimesheetId,
            cellPhone: cellPhone,
            avatarLarge: avatarLarge,
            inTimeStamp: inTimeStamp,
            workStartDate: workStartDate,
            timesheetId: timesheetId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
