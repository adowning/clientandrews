// // import 'package:clientandrews/services/firebaseUser_repository.dart';
// // import 'package:clientandrews/services/firebaseEmployee_repository.dart';
// // import 'package:clientandrews/services/firebaseAssets_repository.dart';
// // import 'package:clientandrews/services/firebaseWorkorder_repository.dart';

// // import 'package:frideos_core/frideos_core.dart';
// // import 'package:frideos/frideos.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// // import 'package:clientandrews/screens/login/login_bloc.dart';
// // import 'package:andrewsapp/screens/employees/employees_bloc.dart';
// // import 'package:andrewsapp/screens/assets/assets_bloc.dart';
// import 'package:clientandrews/screens/shop/workorder_bloc.dart';

// // import 'package:frideos_library/models/models.dart';
// enum AppRoutes { home, login, root }

// class AppState extends AppStateModel {
//   static final AppState _singletonAppState = AppState._internal();

//   AppState._internal();

//   factory AppState() {
//     return _singletonAppState;
//   }

//   // final FirebaseUserRepository respository =
//   //     FirebaseUserRepository(FirebaseAuth.instance);
//   // final FirebaseEmployeeRepository employeesRepository =
//   //     FirebaseEmployeeRepository(_firestore);
//   // final FirestoreAssetsRepository assetsRepository =
//   //     FirestoreAssetsRepository(_firestore);
//   // final FirebaseWorkorderRepository workorderRepository =
//   //     FirebaseWorkorderRepository(_firestore);
//   // static Firestore _firestore = Firestore.instance;

//   // LoginBloc loginBloc;
//   // EmployeesBloc employeesBloc;
//   // AssetsBloc assetsBloc;
//   // WorkordersBloc workordersBloc;
//   // final routeController = StreamedValue<AppRoutes>(initialData: AppRoutes.root);

//   @override
//   init() async {
//     _firestore.settings(
//       timestampsInSnapshotsEnabled: true,
//       persistenceEnabled: true,
//       sslEnabled: true,
//     );

//     loginBloc = LoginBloc(respository);
//     employeesBloc = EmployeesBloc(employeesRepository, assetsRepository);
//     assetsBloc = AssetsBloc(employeesRepository, assetsRepository);
//     workordersBloc = WorkordersBloc(workorderRepository, assetsRepository);
//     // todosBloc.todosSender.setReceiver(statsBloc.todosItems);
//   }

//   @override
//   dispose() {
//     loginBloc.dispose();
//     employeesBloc.dispose();
//     assetsBloc.dispose();
//     workordersBloc.dispose();
//   }
// }
