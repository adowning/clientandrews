import 'package:clientandrews/models/serializers.dart';
import 'package:clientandrews/components/loading.dart';
import 'workorder_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_search/material_search.dart';
import 'dart:async';
import './addWorkorderForm.dart';
import 'package:algolia/algolia.dart';
import '../../models/account.dart';
import '../../models/workorder.dart';
import 'customer_card_view.dart';

class NewCustomerForm extends StatelessWidget {
  // final String phoneNumber;
  // final List serviceItemsList;
  final GlobalKey<FormState> _formKeyx = GlobalKey<FormState>();
  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController lastNameController = new TextEditingController();
  NewCustomerForm(
      // this.phoneNumber,
      // @required this.serviceItemsList,
      );

  @override
  Widget build(BuildContext context) {
    return new Form(
        key: _formKeyx,
        child: new Stack(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      filled: true,
                      icon: Icon(Icons.person_add),
                      labelText: 'First Name',
                      suffixIcon: new FlatButton(
                          onPressed: () {
                            firstNameController.clear();
                          },
                          child: new Icon(Icons.clear))),
                  keyboardType: TextInputType.text,
                  controller: firstNameController,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: new TextFormField(
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        filled: true,
                        icon: Icon(Icons.person_add),
                        labelText: 'Last Name',
                        suffixIcon: new FlatButton(
                            onPressed: () {
                              lastNameController.clear();
                            },
                            child: new Icon(Icons.clear))),
                    keyboardType: TextInputType.text,
                    controller: lastNameController,
                    autofocus: true,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textCapitalization: TextCapitalization.words,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: new Column(
                    children: <Widget>[
                      new RaisedButton(
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        elevation: 4.0,
                        splashColor: Colors.deepPurple,
//                        onPressed: _saving ? null : searchCustomer,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}

// class _UsNumberTextInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final int newTextLength = newValue.text.length;
//     int selectionIndex = newValue.selection.end;
//     int usedSubstringIndex = 0;
//     final StringBuffer newText = StringBuffer();
//     if (newTextLength >= 1) {
//       newText.write('(');
//       if (newValue.selection.end >= 1) selectionIndex++;
//     }
//     if (newTextLength >= 4) {
//       newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
//       if (newValue.selection.end >= 3) selectionIndex += 2;
//     }
//     if (newTextLength >= 7) {
//       newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
//       if (newValue.selection.end >= 6) selectionIndex++;
//     }
//     if (newTextLength >= 11) {
//       newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
//       if (newValue.selection.end >= 10) selectionIndex++;
//     }
//     // Dump the rest.
//     if (newTextLength >= usedSubstringIndex)
//       newText.write(newValue.text.substring(usedSubstringIndex));
//     return TextEditingValue(
//       text: newText.toString(),
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
// }

class LookupCustomerForm extends StatefulWidget {
  // final CustomerCallback onCustomerSet;

  const LookupCustomerForm() : super();
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<LookupCustomerForm> {
  static final Algolia algolia = Algolia.init(
    applicationId: '59EXPAJLR4',
    apiKey: '2ed6f5748d1b4256ec19f9616b067b0d',
  );
  final GlobalKey<FormState> _formKeyLookup = GlobalKey<FormState>();
  TextEditingController listPhoneController = new TextEditingController();
  List<String> _names = List<String>();
  // final _UsNumberTextInputFormatter _phoneNumberFormatter =
  //     _UsNumberTextInputFormatter();
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name = 'No one';
  void _fetchList() async {
    AlgoliaQuery searched = algolia.instance.index('accounts').search('');
    var result = await searched.getObjects();
    _names = List<String>();
    result.hits.forEach((f) => {_names.add(f.data['accountName'])});
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  List<Account> _accounts;

  _buildMaterialSearchPage(BuildContext context) {
    MaterialPageRoute(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Search',
              results: _names
                  .map((String v) => new MaterialSearchResult<String>(
                        icon: Icons.person,
                        value: v,
                        text: "$v",
                      ))
                  .toList(),
              filter: (dynamic value, String criteria) {
                return value.toLowerCase().trim().contains(
                    new RegExp(r'' + criteria.toLowerCase().trim() + ''));
              },
              onSelect: (dynamic value) => Navigator.of(context).pop(value),
              onSubmit: (String value) => Navigator.of(context).pop(value),
            ),
          );
        });
  }

  final Map<String, String> _formData = <String, String>{
    'nickname': '',
    'fullName': '',
    'photoUrl': '',
  };
  bool _foundCustomer = false;
  bool _saving = false;
  Map<String, Account> AccountSnapshot =
      Map<String, Account>(); // create a variable for accessing users by id

  _loadData() {
    // StreamBuilder<QuerySnapshot>(
    //     stream: Firestore.instance
    //         .collection('accounts')
    //         // .where("Phone1", isEqualTo: listPhoneController.text)
    //         .snapshots(),
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       // process usersnapshot from list to map
    //       if (!snapshot.hasData || snapshot.hasError) return LoadingWidget();
    //       print('data loading ');
    //       List<Account> accounts = List<Account>();
    //       snapshot.data.documents.forEach((accountRecord) {
    //         Account account = serializers.deserializeWith<Account>(
    //             Account.serializer, accountRecord.data);
    //         // print(account.firstName); // debug
    //         // snapshot[accountRecord.documentID] = accountRecord.data;
    //         accounts.add(account);
    //       });
    //     });
  }

  _searchCustomer() async {
    setState(() {
      _saving = false;
    });
    // if (listPhoneController.text.length != 14) {
    //   listPhoneController.text = '';
    //   // Navigator.of(context).pop();
    //   setState(() {
    //     _saving = false;
    //   });
    //   return showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: Text('Invalid number'),
    //         );
    //       });
    // }
    var snapshot = await Firestore.instance
        .collection('accounts')
        .where('Phone1', isEqualTo: listPhoneController.text)
        .getDocuments();
    List<Account> newlist = snapshot.documents.map((DocumentSnapshot doc) {
      try {
        Account result =
            serializers.deserializeWith<Account>(Account.serializer, doc.data);
        print(result.accountName);
        if (result.accountID == null)
          result = result.rebuild((b) => b..accountID = doc.documentID);

        return result;
      } catch (error) {
        print(error);
      }
    }).toList();

    // print(newlist.documents[0].data['AccountName']);

    if (newlist.length == 1) {
      // Account account =  serializers.deserializeWith<Account>(
      //     Account.serializer, newlist.documents[0].data);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Is this correct?'),
            content:
                // Container(child: Container(child: Text('Is this correct?'))),
                Container(height: 140, child: CustomerCardView(newlist[0])),
            // CustomerCardView(newlist[0]),
            actions: <Widget>[
              RaisedButton(
                // color: Colors.green,

                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.white),
                ),
                // color: Colors.blue,
                elevation: 4.0,
                onPressed: () {
                  setState(() {
                    _saving = false;
                  });

                  Navigator.of(context).push(new PageRouteBuilder(
                      pageBuilder: (_, __, ___) =>
                          new AddWorkorderForm(account: newlist[0])));
                  // new WorkorderDetailsPage(
                  //     new Workorder(), newlist[0])));
                },
              ),
              RaisedButton(
                // color: Colors.green,

                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.white),
                ),
                // color: Colors.blue,
                elevation: 4.0,
                onPressed: () {
                  setState(() {
                    _saving = false;
                    listPhoneController.text = '';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    // if (newlist.documents.length < 1) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text("Cannot find an existing customer"),
    //         content: Container(
    //             child: Container(child: Text('Create new one or try again?'))),
    //         contentPadding: EdgeInsets.all(20),
    //         actions: <Widget>[
    //           RaisedButton(
    //             child: Text('New', style: TextStyle(color: Colors.white)),
    //             onPressed: () {
    //               setState(() {
    //                 _saving = false;
    //                 listPhoneController.text = '';
    //               });

    //               Navigator.of(context).push(new PageRouteBuilder(
    //                   // pageBuilder: (_, __, ___) =>
    //                   //     new NewCustomerForm(listPhoneController.text)
    //                   ));
    //             },
    //           ),
    //           Container(width: 10),
    //           RaisedButton(
    //             child: Text('Try Again', style: TextStyle(color: Colors.white)),
    //             onPressed: () {
    //               setState(() {
    //                 _saving = false;
    //                 listPhoneController.text = '';
    //               });
    //               Navigator.of(context).pop();
    //             },
    //           )
    //         ],
    //       );
    //     },
    //   );
    // }

    // if (newlist.documents.length > 1) {
    //   String list = '\n';
    //   for (var i = 0; i < newlist.documents.length; i++) {
    //     // if (newlist.documents[i].lastName != null && newlist.documents[i].data['fi'] != null) {
    //     //   list += newlist.documents[i].lastName + ', ' + newlist.documents[i].firstName + "\n";
    //     // }
    //   }

    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text("Accounts with this phone number:\n"),
    //         content: Container(
    //             child: Container(
    //                 child:
    //                     Text(list + '\nCorrect SM before using this number.'))),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text('Ok'),
    //             onPressed: () {
    //               setState(() {
    //                 _saving = false;
    //                 listPhoneController.text = '';
    //               });
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   // }

    // Account data = newlist.documents.first;

    // }

    setState(() {
      _saving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKeyLookup,
            child: new Stack(
              children: <Widget>[
                // _getToolbar(context),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 80.0),
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
                                flex: 3,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Customer',
                                      style: new TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Lookup',
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
                      Padding(
                        padding:
                            EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                        child: new Column(
                          children: <Widget>[
                            // MaterialSearchInput<String>(
                            //   results: _names
                            //       .map((String v) =>
                            //           new MaterialSearchResult<String>(
                            //             icon: Icons.person,
                            //             value: v,
                            //             text: "$v",
                            //           ))
                            //       .toList(),
                            // ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  filled: true,
                                  icon: Icon(Icons.phone),
                                  labelText: 'Phone Number *',
                                  suffixIcon: new FlatButton(
                                      onPressed: () {
                                        listPhoneController.clear();
                                      },
                                      child: new Icon(Icons.clear))),
                              keyboardType: TextInputType.phone,
                              // initialValue: '1111111111',
                              // onSaved: (String value) {
                              //   _phoneNumber = value.; },
                              // validator: _validatePhoneNumber,
                              maxLength: 14,
                              // initialValue: '(903) ',
                              controller: listPhoneController,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                                // Fit the validating format.
                                // _phoneNumberFormatter,
                              ],
                              autofocus: true,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),

                              // textCapitalization: TextCapitalization.none,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0.0),
                              child: new Column(
                                children: <Widget>[
                                  new RaisedButton(
                                      child: const Text(
                                        'Lookup',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.blue,
                                      elevation: 4.0,
                                      splashColor: Colors.deepPurple,
                                      onPressed: () => {
                                            // _formKey.currentState.validate(),
                                            setState(() => _name =
                                                listPhoneController.text),
                                            // _buildMaterialSearchPage(context),
                                            //  _showMaterialSearch(BuildContext context) {
                                            // Navigator.of(context)
                                            //     .push(_buildMaterialSearchPage(
                                            //         context))
                                            //     .then((dynamic value) {
                                            // setState(() => _name =
                                            //     listPhoneController.text
                                            //         )
                                            // })
                                            // }
                                            _searchCustomer(),
                                          }),
                                ],
                              ),
                            ),
                            //                Row(
                            //   children: <Widget>[
                            //     const Spacer(),
                            //     OutlineButton(
                            //       highlightedBorderColor: Colors.black,
                            //       onPressed: _submittable() ? _submit : null,
                            //       child: const Text('Register'),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )) // inAsyncCall: _saving);
        );
    // });
    // }
  }

  bool _submittable() {
    return _foundCustomer;
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  void _submit(c) {
    // widget.onCustomerSet(c);

    // _formKey.currentState.save();W
    setState(() {
      _saving = false;
    });

    const SnackBar snackBar = SnackBar(content: Text('Form submitted'));
    //  Job.of(context).register(_formData);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  String _validatePhoneNumber(String value) {
    // _formWasEdited = true;
    final RegExp phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '(###) ###-#### - Enter a US phone number.';
    return null;
  }

  void _setFoundCustomer(bool newValue) {
    setState(() {
      _foundCustomer = newValue;
    });
  }
}
