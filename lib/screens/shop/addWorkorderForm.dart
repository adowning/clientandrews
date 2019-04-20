import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/account.dart';
import '../../models/workorder.dart';
import './customer_card_view.dart';
import './customer_card_results.dart';
import 'package:clientandrews/app_state.dart';
import 'package:card_settings/card_settings.dart';
import 'package:clientandrews/models/serializers.dart';
import 'package:uuid/uuid.dart';

bool _showMaterialIOS = false;

class AddWorkorderForm extends StatefulWidget {
  // final FirebaseUser user;
  final Account account;
  AddWorkorderForm({Key key, this.account}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewJobPageState();
}

class _NewJobPageState extends State<AddWorkorderForm> {
  TextEditingController jobNotesController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey;
  Workorder _orderModel;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    Map data = new Map<String, dynamic>();
    data['accountID'] = widget.account.accountID;
    data['accountName'] = widget.account.accountName;
    data['address1'] = widget.account.accountName;
    data['city'] = widget.account.accountName;
    data['state'] = widget.account.accountName;
    data['zip'] = widget.account.accountName;
    //TODO fix me
    data['createdBy'] = 'debug';

    // data['createdOn'] = new DateTime.now();
    // data['dateCreated'] = new DateTime.now();
    // data['balanceDue'] = 0;
    // data['discountPercent'] = 0;
    // data['balanceDue'] = 0;
    // data['grandTotal'] = 0;
    // data['tipCollected'] = 0;
    // // data['orderNumber'] = '0';
    // data['grandTotal'] = 0;
    // data['postToAccounting'] = false;
    // data['grandTotal'] = 0;

    _orderModel =
        serializers.deserializeWith<Workorder>(Workorder.serializer, data);

    return Scaffold(
      key: _scaffoldKey,
      body:
          // return new Stack(children: <Widget>[
          Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'New',
                            style: new TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Workorder',
                            style: new TextStyle(
                                fontSize: 28.0, color: Colors.grey),
                          )
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 50.0, left: 0.0, right: 0.0),
            //   child: CustomerCardView(widget.account),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: new Column(
                children: <Widget>[
                  CustomerCardView(widget.account),
                  _buildPortraitLayout(),
                  // new TextFormField(
                  //   decoration: InputDecoration(
                  //       border: new OutlineInputBorder(
                  //           borderSide: new BorderSide(color: Colors.teal)),
                  //       labelText: "Notes",
                  //       contentPadding: EdgeInsets.only(
                  //           left: 16.0, top: 20.0, right: 16.0, bottom: 5.0)),
                  //   controller: jobNotesController,
                  //   autofocus: true,
                  //   style: TextStyle(
                  //     fontSize: 22.0,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  //   keyboardType: TextInputType.text,
                  //   textCapitalization: TextCapitalization.sentences,
                  //   maxLength: 20,
                  // ),
                  // new Padding(
                  //   padding: EdgeInsets.only(bottom: 10.0),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: new Column(
                children: <Widget>[
                  (_saving != true)
                      ? new RaisedButton(
                          child: new Text(
                            _saving ? 'Wait...' : 'Create Order',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                          elevation: 4.0,
                          splashColor: Colors.deepPurple,
                          // onPressed: () => addToFirebase(),
                          // onPressed: () =>
                          //     showInSnackBar(context, widget.model.to()),
                        )
                      : CircularProgressIndicator(
                          backgroundColor: Colors.blue,
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // );

  CardSettings _buildPortraitLayout() {
    return CardSettings.sectioned(
      showMaterialIOS: _showMaterialIOS,
      children: <CardSettingsSection>[
        CardSettingsSection(
          showMaterialIOS: _showMaterialIOS,
          header: CardSettingsHeader(
            label: _orderModel.accountName,
            showMaterialIOS: _showMaterialIOS,
          ),
          children: <Widget>[
            _buildCardSettingsSwitch_Delivered(),
            _buildCardSettingsDatePicker_DueDate(),
            _buildCardSettingsNotes(4),
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

  CardSettingsSwitch _buildCardSettingsSwitch_Delivered() {
    return CardSettingsSwitch(
      showMaterialIOS: _showMaterialIOS,
      key: _formKey,
      label: 'Needs Delivered?',
      initialValue: _orderModel.needsDelivered,
      onSaved: (value) => _orderModel.rebuild((b) => b..needsDelivered = value),
      onChanged: (value) {
        setState(() {
          _orderModel.rebuild((b) => b..needsDelivered = value);
        });
        _showSnackBar('Needs Delivered', value);
      },
    );
  }

  CardSettingsDatePicker _buildCardSettingsDatePicker_DueDate() {
    return CardSettingsDatePicker(
      showMaterialIOS: _showMaterialIOS,
      key: _formKey,
      justDate: true,
      icon: Icon(Icons.calendar_today),
      label: 'Date',
      initialValue: _orderModel.dueDate,
      onSaved: (value) => _orderModel.rebuild(
          (b) => b..dueDate = updateJustDate(value, _orderModel.dueDate)),
      onChanged: (value) {
        setState(() {
          _orderModel.rebuild((b) => b..dueDate = value);
        });
        _showSnackBar('Due Date', updateJustDate(value, _orderModel.dueDate));
      },
    );
  }

  CardSettingsParagraph _buildCardSettingsNotes(int lines) {
    return CardSettingsParagraph(
      showMaterialIOS: _showMaterialIOS,
      key: _formKey,
      label: 'Description',
      initialValue: _orderModel.notes,
      numberOfLines: lines,
      onSaved: (value) => _orderModel.rebuild((b) => b..notes = value),
      onChanged: (value) {
        setState(() {
          _orderModel.rebuild((b) => b..notes = value);
        });
        _showSnackBar('Box Office', value);
      },
    );
  }

  /* EVENT HANDLERS */

  Future _savePressed() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      // showResults(context, orderModel);
    } else {
      setState(() => _autoValidate = true);
    }
  }

  void _resetPressed() {
    _formKey.currentState.reset();
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

  @override
  void dispose() {
    // _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
