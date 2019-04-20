// import 'package:clientandrews/services/firebaseWorkorder_repository.dart';
// import 'package:clientandrews/services/firebaseAssets_repository.dart';
// // import 'package:clientandrews/firebase_repository/workorders_repository.dart';
// import 'package:clientandrews/models/assetHistory.dart';
// import 'package:clientandrews/models/workorder.dart';
// import 'package:clientandrews/models/timesheet.dart';
// import 'package:clientandrews/models/account.dart';
// import 'package:clientandrews/services/firebaseWorkorder_repository.dart';
// import 'package:clientandrews/services/firebaseEmployee_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:device_info/device_info.dart';

// // import 'auth_bloc.dart';
// DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

// class WorkordersBloc {
//   static String androidId;
//   FirebaseEmployeeRepository employeesRepository;
//   // final _owner = BehaviorSubject<Workorder>();
//   FirestoreAssetsRepository assetsRepository;
//   FirebaseWorkorderRepository workordersRepository;

//   WorkordersBloc(
//     this.workordersRepository,
//     this.assetsRepository,
//   ) {
//     init();
//   }

//   Future<Workorder> clockWorkorder(String uid) async {
//     // AndroidDeviceInfo deviceId = await deviceInfo.androidInfo;
//     var emp = await workordersRepository.clockWorkorder(uid, androidId);
//     return emp;
//     // _owner.sink.add(emp);
//   }

//   Future<Timesheet> getCurrentTimesheet(String uid) {
//     return workordersRepository.getCurrentTimesheet(uid);
//   }

//   Stream<QuerySnapshot> getWorkorderGroup() {
//     return workordersRepository.getWorkorderGroup(androidId);
//   }

//   Stream<Workorder> getWorkorder(String uid) {
//     return workordersRepository.getWorkorder(uid);
//   }

//   Stream<List<Account>> getAccountByPhone(String phone) {
//     return workordersRepository.getAccountByPhone(phone);
//   }

//   Stream<List<Workorder>> getWorkorders() {
//     return workordersRepository.getWorkorders();
//   }

//   Stream<List<Timesheet>> getTimesheets() {
//     return workordersRepository.getTimesheets();
//   }

//   void init() async {
//     AndroidDeviceInfo deviceId = await deviceInfo.androidInfo;

//     androidId = deviceId.androidId;
//   }

//   Stream<QuerySnapshot> timesheets(id) {
//     return workordersRepository.timesheets(id);
//   }

//   void checkoutDevice(id) async {
//     await assetsRepository.updateAsset(id, androidId);
//     await workordersRepository.updateWorkorder(id, androidId);
//     await assetsRepository.createAssetHistory(id, androidId);
//   }

//   void dispose() {
//     print('-------StreamedMap BLOC DISPOSE--------');
//     // _owner.dispose();
//   }
// }
