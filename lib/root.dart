import 'package:flutter/material.dart';
// import 'package:andrewsapp/screens/login/login_screen.dart';
// import 'package:andrewsapp/screens/login/login_bloc.dart';
// import 'package:andrewsapp/screens/login/scan_screen.dart';
// import 'package:andrewsapp/screens/employees/profile_screen.dart';
// import 'package:andrewsapp/screens/employees/employees_screen.dart';
import 'package:clientandrews/screens/shop/shop_screen.dart';
import 'package:clientandrews/screens/shop/lookupCustomer.dart';
// import 'package:andrewsapp/models/user.dart';
// import 'package:andrewsapp/models/employee.dart';
// import 'package:andrewsapp/models/car.dart';
import 'package:clientandrews/components/loading.dart';
import 'package:clientandrews/app_state.dart';
import 'package:clientandrews/servertools/tools_screen.dart';
// import 'package:frideos/frideos.dart';/
import 'package:provider/provider.dart';
// import 'package:typed_firestore/typed_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:andrewsapp/components/firestoreUi/animated_firestore_list.dart';

class Root {
  // final appState = AppState();

  // appState.init();
  // final loginBloc = AppState().loginBloc;
  Root() {
    runApp(

        // AppStateProvider<AppState>(
        //   appState: appState,
        //   child:

        MultiProvider(
            providers: [
          // Provider<AppState>(value: appState),
          // Provider<LoginBloc>(value: loginBloc)
        ],
            child: MaterialApp(
              title: "Andrews App",
              debugShowCheckedModeBanner: false,
              home: new RootScreen(),
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  // case '/login':
                  //   return new MyCustomRoute(
                  //     builder: (_) => new LoginScreen(),
                  //     settings: settings,
                  //   );
                  // case '/scanner':
                  //   return new MyCustomRoute(
                  //     builder: (_) => new ScanScreen(),
                  //     settings: settings,
                  //   );
                  // case '/home':
                  //   return new MyCustomRoute(
                  //     builder: (_) => new HomeScreen(),
                  //     settings: settings,
                  //   );
                  // case '/Employees':
                  //   return new MyCustomRoute(
                  //     builder: (_) => new EmployeePage(),
                  //     settings: settings,
                  //   );
                  case '/Shop':
                    return new MyCustomRoute(
                      builder: (_) => new ShopPage(),
                      settings: settings,
                    );
                }
              },
            )));
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({Key key}) : super(key: key);

  @override
  RootScreenState createState() => new RootScreenState();
}

class RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Car x = Car((b) => b..title = 'asdf');
    // print('here');
    // cars.getDocs().asStream();
    // firestore.collection('cars').getDocs().then((f) => {print(f.docs[0].data)});
    // return Text("asdf");
    return ShopPage();
    // final loginBloc = Provider.of<AppState>(context).loginBloc;
    // return ValueBuilder<User>(
    //     streamed: loginBloc.currentUser,
    //     builder: (context, snasphot) => ShopPage(),
    //     noDataChild: ShopPage() // Widget to show when the stream has no data
    //     );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     FadeInWidget(
//       duration: 7000,
//       child: ScrollingText(
//         text: 'Fade in text',
//         scrollingDuration: 2000,
//         style: TextStyle(
//           color: Colors.blue,
//           fontSize: 94.0,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }
