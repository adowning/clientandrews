import 'dart:async';

import 'package:clientandrews/models/account.dart';
import 'package:clientandrews/models/workorder.dart';
import 'package:flutter/material.dart';

import './lookupCustomer.dart';
import './shop_screen.dart';

class NewOrderPage extends StatefulWidget {
  NewOrderPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewOrderPage();
}

class _NewOrderPage extends State<NewOrderPage> {
  TextEditingController listNameController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Workorder newJob = new Workorder();
  Color pickerColor = Color(0xff6633ff);
  Color currentColor = Color(0xff6633ff);

  ValueChanged<Color> onColorChanged;

  bool _saving = false;

  String _connectionStatus = 'Unknown';

  Future<Null> initConnectivity() async {
    String connectionStatus;
    // Platform messages may fail, so we use a try/catch PlatformException.

    if (!mounted) {
      return;
    }

    setState(() {
      _connectionStatus = connectionStatus;
    });
  }

  setJobCustomer(Account c) {}

  Widget _buildForm(context) {
    return ShopPage(
        // onCustomerSet: (Account c) {
        //   setState(() {
        //      newJob.account = c;
        //   });
        // },
        );
    //AddWorkorderForm(user: user, newJob: newJob);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: new Stack(
          children: <Widget>[
            _getToolbar(context),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
                    child: new Column(
                      children: <Widget>[
                        _buildForm(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void dispose() {
    _scaffoldKey.currentState?.dispose();
    // _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();
    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
    //   setState(() {
    //     _connectionStatus = result.toString();
    //   });
    // });/
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState?.removeCurrentSnackBar();

    _scaffoldKey.currentState?.showSnackBar(new SnackBar(
      content: new Text(value, textAlign: TextAlign.center),
      backgroundColor: currentColor,
      duration: Duration(seconds: 3),
    ));
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(left: 10.0, top: 40.0),
      child: new BackButton(color: Colors.black),
    );
  }
}
