import 'package:meta/meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'employee.g.dart';

abstract class Employee implements Built<Employee, EmployeeBuilder> {
  String get id;
  @nullable
  String get fullName;
  @nullable
  String get firstname;
  @nullable
  bool get isOwner;
  @nullable
  String get currentTimesheetId;
  @nullable
  String get cellPhone;
  @nullable
  String get avatarLarge;
  @nullable
  DateTime get inTimeStamp;
  @nullable
  String get workStartDate;
  @nullable
  String get timesheetId;
  //First author

  Employee._();
  factory Employee([updates(EmployeeBuilder b)]) = _$Employee;
  static Serializer<Employee> get serializer => _$employeeSerializer;
  // Employee(
  //     {@required this.id,
  //     @required this.fullName,
  //     @required this.firstname,
  //     @required this.currentTimesheetId,
  //     @required this.avatar,
  //     @required this.work_start_date,
  //     @required this.cell_phone});

  // Employee.fromMap(Map<String, dynamic> map)
  //     : this(
  //           id: map['id'],
  //           fullName: map['fullName'],
  //           firstname: map['firstname'],
  //           avatar: map['avatarLarge'],
  //           work_start_date: map['work_start_date'],
  //           currentTimesheetId: map['currentTimesheetId'] ?? null,
  //           cell_phone: map['cell_phone']);

  // // // Currently not used
  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": this.id,
  //     "fullName": this.fullName,
  //     "firstname": this.firstname,
  //     "work_start_date": this.work_start_date,
  //     "avatar": this.avatar,
  //     "currentTimesheetId": this.currentTimesheetId,
  //     "cell_phone": this.cell_phone,
  //   };
  // }
}
