import 'package:clientandrews/components/firestoreUi/firestore_ui.dart';
import 'package:clientandrews/components/loading.dart';
import 'package:clientandrews/models/account.dart';
import 'package:clientandrews/models/line_item.dart';
import 'package:clientandrews/models/serializers.dart';
import 'package:clientandrews/models/workorder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'gsy_style.dart';
import 'workorder_detail.dart';
import 'shop_screen.dart';

class WorkorderCard extends StatelessWidget {
  final Workorder order;
  final Account account;
  WorkorderCard(this.order, this.account);

  _buildLineItems() {
    return FirestoreAnimatedList(
        query: Firestore.instance
            .collection('orders')
            .document(order.orderID)
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
            item = serializers.deserializeWith<LineItem>(
                LineItem.serializer, snapshot.data);
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
        });
  }
  // Expanded(
  //     flex: 2,
  //     child: Text(item.name,
  //         style: TextStyle(
  //             color: Color(GSYColors.mainTextColor),
  //             fontWeight: FontWeight.w400,
  //             fontSize: 14.0))),
  // Container(width: 20),
  // Expanded(
  //     flex: 5,
  //     child: Text(item.name,
  //         style: TextStyle(
  //             color: Color(GSYColors.mainTextColor),
  //             fontWeight: FontWeight.w400,
  //             fontSize: 14.0))),
  // Spacer(),
  // Container(width: 90),
  // Expanded(
  //     flex: 1,
  //     child: Text(item.quantity.toString(),
  //         style: TextStyle(
  //             color: Color(GSYColors.mainTextColor),
  //             fontWeight: FontWeight.w400,
  //             fontSize: 14.0))),
  // Container(width: 90),
//                                    Expanded(
//                                        flex: 1,
//                                        child: Text(
////                                            (result.price * result.quantity)
////                                                .toString(),
//                                            style: TextStyle(
//                                                color: Color(
//                                                    GSYColors.mainTextColor),
//                                                fontWeight: FontWeight.w400,
//                                                fontSize: 14.0))),
  // ],
  // )))

  @override
  Widget build(BuildContext context) {
    return
        // GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).push(
        //         new PageRouteBuilder(
        //           pageBuilder: (_, __, ___) => new WorkorderDetailsPage(
        //                 order,
        //               ),
        //           transitionsBuilder:
        //               (context, animation, secondaryAnimation, child) =>
        //                   new ScaleTransition(
        //                     scale: new Tween<double>(
        //                       begin: 1.5,
        //                       end: 1.0,
        //                     ).animate(
        //                       CurvedAnimation(
        //                         parent: animation,
        //                         curve: Interval(
        //                           0.50,
        //                           1.00,
        //                           curve: Curves.linear,
        //                         ),
        //                       ),
        //                     ),
        //                     child: ScaleTransition(
        //                       scale: Tween<double>(
        //                         begin: 0.0,
        //                         end: 1.0,
        //                       ).animate(
        //                         CurvedAnimation(
        //                           parent: animation,
        //                           curve: Interval(
        //                             0.00,
        //                             0.50,
        //                             curve: Curves.linear,
        //                           ),
        //                         ),
        //                       ),
        //                       child: child,
        //                     ),
        //                   ),
        //         ),
        //       );
        //     },
        //     child:
        // Card(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(2.0)),
        //     ),
        //     // color: Color(int.parse(cardColor.elementAt(index))),
        //     color: Colors.white,
        //
        Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: Container(
        height: 360.0,
        padding: EdgeInsets.only(bottom: 25.0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },
          child: new StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('orders')
                  .document(order.orderID)
                  .collection('lineItems')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return new Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ));
                return new ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  scrollDirection: Axis.horizontal,
                  children: getExpenseItems(snapshot, context),
                );
              }),
        ),
      ),
    );
    // child:
    //     StreamBuilder<QuerySnapshot>(
    //         stream: Firestore.instance
    //             .collection('orders')
    //             .document(order.orderID)
    //             .collection('lineItems')
    //             .snapshots(),
    //         builder: (BuildContext context,
    //             AsyncSnapshot<QuerySnapshot> accountsnapshot) {
    //           // process usersnapshot from list to map
    //           if (!accountsnapshot.hasData || accountsnapshot.hasError)
    //             return LoadingWidget();
    //           // child: Text('asdfdf')
    //           return ListView(
    //               physics: const BouncingScrollPhysics(),
    //               padding: EdgeInsets.only(left: 40.0, right: 40.0),
    //               scrollDirection: Axis.horizontal,
    //               children: <Widget>[
    //                 getExpenseItems(accountsnapshot, context),
    //               ]);
    //           // }));
    //         });
  }
  // ListTile(
  //     // isThreeLine: true,

  //     contentPadding: EdgeInsets.all(4),
  //     title: Text(account.accountName),
  //     subtitle: Text(account.phones[0]),
  //     trailing: Text('not started'),
  //     dense: true,
  //     // subtitle: Text(item.description),
  //     leading: Container(
  //       decoration: BoxDecoration(
  //           border: Border.all(width: 2), color: Colors.grey),
  //       child: Image.network(
  //           "https://six.servicemonster.net/app/client/desktop/css/images/unknown-home.png"),
  //       height: 180,
  //       width: 40,
  //     )))
  // Column(children: <Widget>[
  //   Flexible(
  //     flex: 1, child: Text('asdfsdf'),
  //     // Padding(
  //     //     padding: EdgeInsets.only(top: 10.0, bottom: 1.0, left: 10),
  //   ),
  //   Flexible(
  //       flex: 1,
  //       child: ListTile(
  //           // isThreeLine: true,
  //           contentPadding: EdgeInsets.all(4),
  //           title: Text(account.accountName),
  //           subtitle: Text(account.phones[0]),
  //           trailing: Text('not started'),
  //           dense: true,
  //           // subtitle: Text(item.description),
  //           leading: Container(
  //             decoration: BoxDecoration(
  //                 border: Border.all(width: 2), color: Colors.grey),
  //             child: Image.network(
  //                 "https://six.servicemonster.net/app/client/desktop/css/images/unknown-home.png"),
  //             height: 180,
  //             width: 40,
  //           )))
  // ]),

  // )
//                  Text(
//                   account.accountName ?? '<No accountIdx retrieved>',
//                   //  userMap.values.elementAt(index).length,
// //                      (data.account.accountName != null)
// //                          ? data.account.accountName
// //                          : data.account.lastName +
// //                              ', ' +
// //                              data.account.firstName,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 19.0,
//                   ),
//                 ),
  // ),
  // ),
  // Padding(
  //   padding: EdgeInsets.only(top: 5.0),
  //   child: Row(
  //     children: <Widget>[
  //       Expanded(
  //         flex: 2,
  //         child: Container(
  //           margin: EdgeInsets.only(left: 10.0, right: 10),
  //           color: Colors.grey,
  //           height: 1.5,
  //         ),
  //       ),
  //     ],
  //   ),
  // ),
  // _buildLineItems(),
  // ),

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot, context) {
    return new GestureDetector(
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        color: Colors.white,
        child: new Container(
          width: 220.0,
          //height: 100.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
                  child: Container(
                    child: Text(
                      "asdF",
                      // userMap.keys.elementAt(index),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(left: 50.0),
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 15.0, right: 5.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 220.0,
                        child: ListView.builder(
                            //physics: const NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            // userMap.values.elementAt(index).length,
                            itemBuilder: (BuildContext ctxt, int i) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  // Icon(
                                  //   userMap.values
                                  //           .elementAt(index)
                                  //           .elementAt(i)
                                  //           .isDone
                                  //       ? FontAwesomeIcons.checkCircle
                                  //       : FontAwesomeIcons.circle,
                                  //   color: userMap.values
                                  //           .elementAt(index)
                                  //           .elementAt(i)
                                  //           .isDone
                                  //       ? Colors.white70
                                  //       : Colors.white,
                                  //   size: 14.0,
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                  ),
                                  Flexible(
                                    child: Text("asdf"),
                                    // userMap.values
                                    //     .elementAt(index)
                                    //     .elementAt(i)
                                    //     .name,
                                    // style: userMap.values
                                    //         .elementAt(index)
                                    //         .elementAt(i)
                                    //         .isDone
                                    // ? TextStyle(
                                    //     decoration: TextDecoration
                                    //         .lineThrough,
                                    //     color: Colors.white70,
                                    //     fontSize: 17.0,
                                    //   )
                                    // : TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 17.0,
                                    //   ),
                                  ),
                                  // ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // });
  }
}
// class LineItemRow extends StatelessWidget {
//   final int index;
//   final LineItem item;
//   final Function(DocumentSnapshot) onTap;

//   const LineItemRow({
//     Key key,
//     this.index,
//     this.item,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(item?.name ?? '<No message retrieved>'),
//       subtitle: Text('Message ${this.index + 1}'),
// //      onTap: () => onTap(this.document),
//     );
//   }
// }
