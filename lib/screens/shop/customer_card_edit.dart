import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:card_settings/card_settings.dart';
import 'customer_card_results.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../../models/account.dart';

bool _showMaterialIOS = false;

class CustomerCard extends StatefulWidget {
  final accountModel;
  CustomerCard(this.accountModel);
  @override
  _CustomerCardState createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  // final widget.accountModel = widget.accountModel;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return _buildPortraitLayout();

    // return Scaffold(
    //   key: _scaffoldKey,
    //   appBar: AppBar(
    //     title: Text("My Little Pony"),
    //     actions: <Widget>[
    //       Container(
    //         child: Platform.isIOS
    //             ? IconButton(
    //                 icon: Icon(Icons.swap_calls),
    //                 onPressed: () {
    //                   setState(() {
    //                     _showMaterialIOS = !_showMaterialIOS;
    //                   });
    //                 },
    //               )
    //             : null,
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.save),
    //         onPressed: _savePressed,
    //       ),
    //     ],
    //     leading: IconButton(
    //       icon: Icon(Icons.refresh),
    //       onPressed: _resetPressed,
    //     ),
    //   ),
    //   body: Form(key: _formKey, child: _buildPortraitLayout()),
    // );
  }

  CardSettings _buildPortraitLayout() {
    return CardSettings.sectioned(
      showMaterialIOS: _showMaterialIOS,
      children: <CardSettingsSection>[
        CardSettingsSection(
          showMaterialIOS: _showMaterialIOS,
          header: CardSettingsHeader(
            label: widget.accountModel.accountName,
            showMaterialIOS: _showMaterialIOS,
          ),
          children: <Widget>[
            _buildCardSettingsText_FirstName(),
            _buildCardSettingsText_LastName(),
            _buildCardSettingsEmail(),
            _buildCardSettingsNotes(5),
            _buildCardSettingsPhone(),
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

  CardSettingsEmail _buildCardSettingsEmail() {
    return CardSettingsEmail(
      showMaterialIOS: _showMaterialIOS,
      key: _formKey,
      icon: Icon(Icons.person),
      initialValue: widget.accountModel.email,
      autovalidate: _autoValidate,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Email is required.';
        if (!value.contains('@'))
          return "Email not formatted correctly."; // use regex in real application
        return null;
      },
      onSaved: (value) => widget.accountModel.rebuild((b) => b..email = value),
      onChanged: (value) {
        setState(() {
          widget.accountModel.rebuild((b) => b..email = value);
        });
        _showSnackBar('Email', value);
      },
    );
  }

  CardSettingsPhone _buildCardSettingsPhone() {
    return CardSettingsPhone(
      showMaterialIOS: _showMaterialIOS,
      key: _formKey,
      label: 'Box Office',
      initialValue: int.parse(widget.accountModel.phone1),
      autovalidate: _autoValidate,
      validator: (value) {
        if (value != null && value.toString().length != 10)
          return 'Incomplete number';
        return null;
      },
      //  widget.accountModel = widget.accountModel.rebuild((b) => b..phone1 = value);
      onSaved: (value) =>
          widget.accountModel.rebuild((b) => b..phone1 = value.toString()),
      onChanged: (value) {
        setState(() {
          widget.accountModel.rebuild((b) => b..phone1 = value.toString());
        });
        _showSnackBar('Box Office', value);
      },
    );
  }

  CardSettingsParagraph _buildCardSettingsNotes(int lines) {
    return CardSettingsParagraph(
      showMaterialIOS: _showMaterialIOS,
      key: _formKey,
      label: 'Description',
      initialValue: widget.accountModel.notes,
      numberOfLines: lines,
      onSaved: (value) => widget.accountModel.rebuild((b) => b..notes = value),
      onChanged: (value) {
        setState(() {
          widget.accountModel.rebuild((b) => b..notes = value);
        });
        _showSnackBar('Box Office', value);
      },
    );
  }

  CardSettingsText _buildCardSettingsText_FirstName() {
    return CardSettingsText(
      showMaterialIOS: _showMaterialIOS,
      key: _formKey,
      label: 'First Name',
      hintText: 'first name',
      initialValue: widget.accountModel.firstName,
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

  CardSettingsText _buildCardSettingsText_LastName() {
    return CardSettingsText(
      showMaterialIOS: _showMaterialIOS,
      key: _formKey,
      label: 'Last Name',
      hintText: 'last name',
      initialValue: widget.accountModel.lastName,
      requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
      autovalidate: _autoValidate,
      contentAlign: TextAlign.right,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Last name is required.';
        return null;
      },
      showErrorIOS: widget.accountModel.lastName == null ||
          widget.accountModel.lastName.isEmpty,
      onSaved: (value) =>
          widget.accountModel.rebuild((b) => b..lastName = value),
      onChanged: (value) {
        setState(() {
          widget.accountModel.rebuild((b) => b..lastName = value);
        });
        _showSnackBar('Last Name', value);
      },
    );
  }
  // CardSettingsDatePicker _buildCardSettingsDatePicker() {
  //   return CardSettingsDatePicker(
  //     showMaterialIOS: _showMaterialIOS,
  //     key: _formKey,
  //     justDate: true,
  //     icon: Icon(Icons.calendar_today),
  //     label: 'Date',
  //     initialValue: widget.accountModel.,
  //     onSaved: (value) => widget.accountModel.showDateTime =
  //         updateJustDate(value, widget.accountModel.showDateTime),
  //     onChanged: (value) {
  //       setState(() {
  //         widget.accountModel.showDateTime = value;
  //       });
  //       _showSnackBar(
  //           'Show Date', updateJustDate(value, widget.accountModel.showDateTime));
  //     },
  //   );
  // }
  /* EVENT HANDLERS */

  Future _savePressed() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      showResults(context, widget.accountModel);
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
}
