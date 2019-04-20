import 'package:clientandrews/components/firestoreUi/firestore_ui.dart';
import 'package:clientandrews/components/loading.dart';
import 'package:clientandrews/models/account.dart';
import 'package:clientandrews/models/serializers.dart';
import 'package:clientandrews/models/workorder.dart';
import 'package:clientandrews/models/line_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'page_addWorkorder.dart';
import 'workorderCard.dart';
import 'workorder_detail.dart';
import 'lookupCustomer.dart';
import 'package:intl/intl.dart';

class ShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopPageState();
  }
}

class _ShopPageState extends State<ShopPage> {
  final GlobalKey<ScaffoldState> _shopScaffoldKey =
      new GlobalKey<ScaffoldState>();
  bool error = false;
  @override
  void initState() {
    super.initState();
  }

  List<String> wordlist = new List<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            // _getToolbar(context),
            new Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
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
                                'Task',
                                style: new TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Lists',
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
                //   padding: EdgeInsets.only(top: 20.0),
                //   child:
                // ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Container(
                height: 460.0,
                padding: EdgeInsets.only(bottom: 25.0),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                  },
                  child: new StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection('workorders')
                          // .orderBy("date", descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData)
                          return new Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                          ));
                        return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            order.id =
                                snapshot.data.documents[index].data['id'] =
                                    snapshot.data.documents[index].documentID;

                            return getExpenseItems(
                                snapshot.data.documents[index]);
                          },
                        ); // ListView(
                        //     physics: const BouncingScrollPhysics(),
                        //     padding: EdgeInsets.only(left: 40.0, right: 40.0),
                        //     scrollDirection: Axis.horizontal,
                        //     children: <Widget>[getExpenseItems(snapshot)]
                        //     //  getExpenseItems(snapshot),
                        //     );
                      }),
                ),
              ),
            ),
            new Column(
              children: <Widget>[
                new Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: new IconButton(
                    icon: new Icon(Icons.add),
                    // onPressed: _addTaskPressed,
                    iconSize: 30.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child:
                      Text('Add List', style: TextStyle(color: Colors.black45)),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: FloatingActionButton.extended(
              label: Text('New Order'),
              icon: Icon(Icons.add),
              onPressed: () async {
                _addOrderPressed(context);
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  getExpenseItems(DocumentSnapshot _item) {
    Workorder order = serializers.deserializeWith<Workorder>(
        Workorder.serializer, _item.data);
    return
        // List.generate(snapshot.data.documents.length, (int index) {
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new ShopPage(
                      // user: widget.user,
                      // i: index,
                      // currentList: userMap,
                      // color: cardColor.elementAt(index),
                      ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new ScaleTransition(
                            scale: new Tween<double>(
                              begin: 1.5,
                              end: 1.0,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Interval(
                                  0.50,
                                  1.00,
                                  curve: Curves.linear,
                                ),
                              ),
                            ),
                            child: ScaleTransition(
                              scale: Tween<double>(
                                begin: 0.0,
                                end: 1.0,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Interval(
                                    0.00,
                                    0.50,
                                    curve: Curves.linear,
                                  ),
                                ),
                              ),
                              child: child,
                            ),
                          ),
                ),
              );
            },
            child: Container(
                // decoration: BoxDecoration(border: Border.all()),
                child: Card(
                    shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        ),
                    borderOnForeground: true,
                    elevation: 4,
                    // color: Colors.blue,
                    child: new Container(
                        width: 220.0,

                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage('assets/icon.png'))),
                        //height: 100.0,
                        child: Container(
                            child: Column(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: ListTile(
                                  // isThreeLine: true,
                                  // contentPadding: EdgeInsets.all(4),
                                  title: Text(order.accountName),
                                  trailing: Text(''),
                                  subtitle: Text(
                                      DateFormat.yMd().format(order.dueDate)),
                                  dense: true,
                                  // subtitle: Text(item.description),
                                  leading: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: .5),
                                        color: Colors.grey),
                                    child:
                                        Image.asset('assets/unknown-home.png'),
                                    // height: 130,
                                    // width: 40,
                                  ))
                              // Container(
                              //   child: Text(
                              //     order.accountID,
                              //     // userMap.keys.elementAt(index),
                              //     style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 19.0,
                              //     ),
                              //   ),
                              // ),
                              ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 10.0, right: 10),
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 30.0, left: 15.0, right: 5.0),
                              child: Column(children: <Widget>[
                                SizedBox(
                                    height: 220.0,
                                    child: FirestoreAnimatedList(
                                        query: Firestore.instance
                                            .collection('workorders')
                                            .document(order.orderID.toString())
                                            .collection('lineItems')
                                            .snapshots(),
                                        itemBuilder: (
                                          BuildContext context,
                                          DocumentSnapshot snapshot,
                                          Animation<double> animation,
                                          int index,
                                        ) {
                                          LineItem item;
                                          if (snapshot.data != null) {
                                            //
                                            item = serializers
                                                .deserializeWith<LineItem>(
                                                    LineItem.serializer,
                                                    snapshot.data);
                                          }
                                          return FadeTransition(
                                            opacity: animation,
                                            child: ListTile(
                                              isThreeLine: true,
                                              contentPadding: EdgeInsets.all(4),
                                              title: Text(item.name),
                                              trailing: Text('not started'),
                                              dense: true,
                                              subtitle: Text(item.description),
                                              leading: Image.network(
                                                  'https://firebasestorage.googleapis.com/v0/b/andrewsgroup-dev.appspot.com/o/images%2Fhardware%2Ftablet.jpg?alt=media&token=589a35c2-1272-404b-bd63-4e42e4765d6e'),
                                            ),
                                          );
                                        }))
                              ]))
                        ]))))));
  }

  //  ListView.builder(
  //     //physics: const NeverScrollableScrollPhysics(),
  //     itemCount: 1,
  //     itemBuilder: (BuildContext ctxt, int i) {
  //       return Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: <Widget>[
  //           Icon(
  //             // userMap.values
  //             //         .elementAt(index)
  //             //         .elementAt(i)
  //             //         .isDone
  //             Icons.check_box,
  //             // Icons.check_box,
  //             color: Colors.black,
  //             // ? Colors.white70
  //             // : Colors.white,
  //             size: 14.0,
  //           ),
  //           Padding(
  //             padding: EdgeInsets.only(left: 10.0),
  //           ),
  //           Flexible(
  //             child: Text(
  //                 userMap.values
  //                     .elementAt(index)
  //                     .elementAt(i)
  //                     .accountID,
  //                 style: TextStyle(
  //                   decoration:
  //                       TextDecoration.lineThrough,
  //                   color: Colors.white70,
  //                   fontSize: 17.0,
  //                 )),
  //           ),
  //         ],
  //       );
  //     }),

}
// );

//   @override
//   Widget build(BuildContext context) {
//     wordlist.add('Work');
//     wordlist.add('Shop');
//     return Scaffold(
//         key: _shopScaffoldKey,
//         backgroundColor: Theme.of(context).backgroundColor,
//         body: _buildStreamBuilder(),
//         // Stack(children: <Widget>[
//         //   CustomAppBar(
//         //     returnRoute: 'ShopPage',
//         //     goBack: false,
//         //     closePage: false,
//         //     hasIcon: true,
//         //     iconColor: Colors.green,
//         //     wordList: wordlist,
//         //     searchBar: false,
//         //   ),
//         //   // TwoWordHeader(wordList: wordlist),
//         //   Padding(
//         //     padding: EdgeInsets.only(top: 20, bottom: 90),
//         //     child: SafeArea(
//         //       top: true,
//         //       child: _buildStreamBuilder(),
//         //     ),
//         //   )
//         // ]),
//         floatingActionButton: Padding(
//           padding: EdgeInsets.only(bottom: 20.0),
//           child: FloatingActionButton.extended(
//               label: Text('New Order'),
//               icon: Icon(Icons.add),
//               onPressed: () async {
//                 _addOrderPressed(context);
//               }),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
//   }

//   Widget _buildStreamBuilder() {
//     Map AccountSnapshot = Map(); // create a variable for accessing users by id

//     return ListView(children: <Widget>[
//       //  Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
//       StreamBuilder<QuerySnapshot>(
//           stream: Firestore.instance.collection('accounts').snapshots(),
//           builder: (BuildContext context,
//               AsyncSnapshot<QuerySnapshot> accountsnapshot) {
//             // process usersnapshot from list to map
//             if (!accountsnapshot.hasData || accountsnapshot.hasError)
//               return LoadingWidget();

//             if (accountsnapshot.connectionState == ConnectionState.active) {
//               // Account account = serializers.deserializeWith<Account>(
//               //     Account.serializer, accountRecord.data);
//               return FirestoreAnimatedList(
//                   query: Firestore.instance.collection('orders').snapshots(),
//                   scrollDirection: Axis.horizontal,
//                   // shrinkWrap: true,
//                   itemBuilder: (
//                     BuildContext context,
//                     DocumentSnapshot snapshot,
//                     Animation<double> animation,
//                     int index,
//                   ) {
//                     Workorder result;
//                     Account account;
//                     if (snapshot.data != null) {
//                       result = serializers.deserializeWith<Workorder>(
//                           Workorder.serializer, snapshot.data);
//                       for (var x in accountsnapshot.data.documents) {
//                         if (x.documentID == result.accountID) {
//                           x.data['accountID'] = x.documentID;
//                           (x.data['accountName'] == null)
//                               ? x.data['accountName'] = x.data['name']
//                               : null;
//                           (x.data['accountType'] == null)
//                               ? x.data['accountType'] = 'customer'
//                               : null;
//                           account = serializers.deserializeWith<Account>(
//                               Account.serializer, x.data);
//                         }
//                       }
//                       return (result != null && account != null)
//                           ? WorkorderCard(result, account)
//                           //  FadeTransition(
//                           //     opacity: animation,
//                           //     child: Container(
//                           //         height: 300,
//                           //         child: Row(
//                           //           children: <Widget>[
//                           //             Expanded(
//                           //               flex: 1,
//                           //               child: WorkorderCard(result, account),
//                           //             )
//                           //           ],
//                           //         )))
//                           : Container(width: 0, height: 0);
//                     }
//                     ;
//                   });
//             } else {
//               return LoadingWidget();
//             }
//           })
//     ]);
//     // ]);
//   }

//    final _workorderBloc = Provider.of<AppState>(context).workordersBloc;
//    return StreamBuilder<List<Workorder>>(
//        stream: _workorderBloc.getWorkorders(),
//        builder:
//            (BuildContext context, AsyncSnapshot<List<Workorder>> snapshot) {
//          if (!snapshot.hasData) {
//            return LoadingWidget();
//          }
//          return Scaffold(
//              backgroundColor: Theme.of(context).backgroundColor,
//              body: SafeArea(
//                  top: true,
//                  child: Padding(
//                      padding: EdgeInsets.only(top: 2, bottom: 12),
//                      child: ListView(
//                          physics: const BouncingScrollPhysics(),
//                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
//                          scrollDirection: Axis.horizontal,
//                          children: snapshot.data
//                              .map<Widget>(
//                                  (Workorder data) => WorkorderCard(data))
//                              .toList()))));
//        });
//  }

Widget _buildError({String errorString}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          onPressed: () {
            // if (mounted) {
            //   error = false;
            //   model.getWorkorders();
            //   if (this.mounted) {
            //     setState(() {});
            //     model.outsideLoading(true);
            //   }
            // }
          },
        ),
        Text(
          errorString,
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}

void _addOrderPressed(
  context,
) async {
  Navigator.of(context).push(
    new PageRouteBuilder(
      pageBuilder: (_, __, ___) => new LookupCustomerForm(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          new ScaleTransition(
            scale: new Tween<double>(
              begin: 1.5,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.50,
                  1.00,
                  curve: Curves.linear,
                ),
              ),
            ),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.00,
                    0.50,
                    curve: Curves.linear,
                  ),
                ),
              ),
              child: child,
            ),
          ),
    ),
  );
  //Navigator.of(context).pushNamed('/new');
}

class MessageList extends StatelessWidget {
  MessageList({this.firestore});

  final Firestore firestore;

  @override
  Widget build(BuildContext context) {
    Map UserSnapshot = Map(); // create a variable for accessing users by id

    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('users').snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> UsersSnapshot) {
          // process usersnapshot from list to map
          UsersSnapshot.data.documents.forEach((userRecord) {
            //print(optionRecord.documentID); // debug
            UserSnapshot[userRecord.documentID] = userRecord;
          });
          // user data can be accessed as soon as there is a reference field or documentID:
          // UserSnapshot[document['userRef']]['userName'}

          return StreamBuilder<QuerySnapshot>(
            stream: firestore.collection('messages').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> MessagesSnapshot) {
              if (!MessagesSnapshot.hasData) return const Text('Loading...');
              final int messageCount = MessagesSnapshot.data.documents.length;
              return ListView.builder(
                itemCount: messageCount,
                itemBuilder: (_, int index) {
                  final DocumentSnapshot document =
                      MessagesSnapshot.data.documents[index];
                  // document['userRef'] exists here
                  // UserSnapshot[document['userRef']]['userName'} is accessible here
                  return ListTile(
                    title:
                        Text(document['message'] ?? '<No message retrieved>'),
                    subtitle: Text('Message ${index + 1} of $messageCount'),
                  );
                },
              );
            },
          );
        });
  }
}
