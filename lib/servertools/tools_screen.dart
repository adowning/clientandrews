import 'package:flutter/material.dart';
import 'dart:async';
import 'package:card_settings/card_settings.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import '../models/account.dart';
import '../models/workorder.dart';
import 'package:clientandrews/models/account.dart';
import 'package:clientandrews/models/serializers.dart';
import 'package:clientandrews/models/workorder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool _showMaterialIOS = false;

class ServerToolsScreen extends StatefulWidget {
  // final accountModel;
  final accountModel = Account();
  ServerToolsScreen();
  @override
  _ServerToolsScreenState createState() => _ServerToolsScreenState();
}

class _ServerToolsScreenState extends State<ServerToolsScreen> {
  final GlobalKey<FormState> _buildCardSettingsText_FirstNameKey =
      GlobalKey<FormState>();
  final Firestore firestore = Firestore.instance;
  CollectionReference get workorders => firestore.collection('workorders');

  final GlobalKey<FormState> _serverFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  // final widget.accountModel = widget.accountModel;
  _setup() async {
    var dio = Dio();
    // replace dio default transformer
    dio.transformer = new FlutterTransformer();
    dio.options.headers['Authorization'] =
        'Basic Sk5wbkZOelhxOnltMWM4cGU4QzNPNHM3bDBBVms=';
    var rugList = [
      18455,
      20251,
      20679,
      20866,
      21556,
      21537,
      22731,
      22974,
      23100,
      23210,
      23188,
      23065,
      23330,
      23479,
      23514,
      23532,
      23596,
      23682,
      23708,
      23710,
      23742,
      23746,
      23654,
      23753,
      23752,
      23756,
      23762,
      23765,
      23789,
      23786,
      23793,
      23801,
      23800,
      23819
    ];

    rugList.forEach((id) async {
      Response response =
          // await dio.get("https://api.github.com/orgs/flutterchina/repos");
          await dio.get(
              "https://api.servicemonster.net/v1/orders?wField=orderNumber&wValue=" +
                  id.toString());
      // List<Workorder> list = List<Workorder>();

      response.data['items'].forEach((snapShot) async {
        // Workorder order = serializers.deserializeWith<Workorder>(
        //     Workorder.serializer, snapShot);
        snapShot['serviceType'] = 'inhouse';
        await workorders.document(snapShot['orderId']).setData(snapShot);
        // workorders.add();
      });

      print(response.data['items'][0]);
    });
    //   Response response =
    //       // await dio.get("https://api.github.com/orgs/flutterchina/repos");
    //       await dio.get("https://api.servicemonster.net/v1/orders?wField=");
    //   List<Workorder> list = List<Workorder>();

    //   response.data['items'].forEach((snapShot) async {
    //     Workorder order = serializers.deserializeWith<Workorder>(
    //         Workorder.serializer, snapShot);
    //     list.add(order);
    //     await workorders.add(snapShot);
    //   });
    //   print(list[0]);
  }

  @override
  void initState() {
    _setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("My Little Pony"),
        actions: <Widget>[
          Container(
            child: Platform.isIOS
                ? IconButton(
                    icon: Icon(Icons.swap_calls),
                    onPressed: () {
                      setState(() {
                        _showMaterialIOS = !_showMaterialIOS;
                      });
                    },
                  )
                : null,
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _savePressed,
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _resetPressed,
        ),
      ),
      body: Form(key: _serverFormKey, child: _buildPortraitLayout()),
    );
  }

  CardSettings _buildPortraitLayout() {
    return CardSettings.sectioned(
      showMaterialIOS: _showMaterialIOS,
      children: <CardSettingsSection>[
        CardSettingsSection(
          showMaterialIOS: _showMaterialIOS,
          header: CardSettingsHeader(
            label: 'Server tools',
            showMaterialIOS: _showMaterialIOS,
          ),
          children: <Widget>[
            _buildCardSettingsText_FirstName(),
            // _buildCardSettingsText_LastName(),
            // _buildCardSettingsEmail(),
            // _buildCardSettingsNotes(5),
            // _buildCardSettingsPhone(),
          ],
        ),
        CardSettingsSection(
          showMaterialIOS: _showMaterialIOS,
          header: CardSettingsHeader(
            label: 'Actions',
            showMaterialIOS: _showMaterialIOS,
          ),
          children: <Widget>[
            _buildCardSettingsButton_Save(),
            _buildCardSettingsButton_Reset(),
          ],
        ),
      ],
    );
  }

  /* BUILDERS FOR EACH FIELD */

  CardSettingsButton _buildCardSettingsButton_Reset() {
    return CardSettingsButton(
      showMaterialIOS: _showMaterialIOS,
      label: 'RESET',
      isDestructive: true,
      onPressed: _resetPressed,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
    );
  }

  CardSettingsButton _buildCardSettingsButton_Save() {
    return CardSettingsButton(
      showMaterialIOS: _showMaterialIOS,
      label: 'SAVE',
      onPressed: _savePressed,
    );
  }

  CardSettingsText _buildCardSettingsText_FirstName() {
    return CardSettingsText(
      showMaterialIOS: _showMaterialIOS,
      key: _buildCardSettingsText_FirstNameKey,
      label: 'First Name',
      hintText: 'first name',
      initialValue: "https//api.servicemonster.net",
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      autovalidate: _autoValidate,
      contentAlign: TextAlign.right,
      validator: (value) {
        if (value == null || value.isEmpty) return 'First name is required.';
        return null;
      },
      showErrorIOS: widget.accountModel.firstName == null ||
          widget.accountModel.firstName.isEmpty,
      onSaved: (value) =>
          widget.accountModel.rebuild((b) => b..firstName = value),
      onChanged: (value) {
        setState(() {
          widget.accountModel.rebuild((b) => b..lastName = value);
        });
        _showSnackBar('First Name', value);
      },
    );
  }

  Future _savePressed() async {
    final form = _serverFormKey.currentState;

    if (form.validate()) {
      form.save();
      // showResults(context, widget.accountModel);
    } else {
      setState(() => _autoValidate = true);
    }
  }

  void _resetPressed() {
    _serverFormKey.currentState.reset();
  }

  void _showSnackBar(String label, dynamic value) {
    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(label + ' = ' + value.toString()),
      ),
    );
  }
}
