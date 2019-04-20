import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';

import 'package:clientandrews/components/firestoreUi/firestore_ui.dart';
import 'package:clientandrews/models/asset_history.dart';
import 'package:clientandrews/models/line_item.dart';
import 'package:clientandrews/models/serializers.dart';
import 'package:clientandrews/models/workorder.dart';
import 'package:clientandrews/models/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'gsy_style.dart';
import 'workorder_bloc.dart';

class WorkorderDetailsPage extends StatefulWidget {
  final Workorder order;
  final Account account;
  // final String currentOwnerId;

  WorkorderDetailsPage(this.order, this.account);
  @override
  _workordereDetailsState createState() => _workordereDetailsState();
}

class _workordereDetailsState extends State<WorkorderDetailsPage>
    with TickerProviderStateMixin {
//  static StreamController _ctrl = StreamController();

  GlobalKey<ScaffoldState> key = new GlobalKey();
  Color themeColor = Colors.blue;
  Color primaryColor = const Color(0xFF117cc1);

  bool loading;
  // WorkordersBloc _ordersBloc;
  List<AssetHistory> history;

//  Workorder workorder;
  TabController _controller;
  Animation<double> listTileWidth;
  Animation<Alignment> listSlideAnimation;
  Animation<EdgeInsets> listSlidePosition;
  AnimationController animationController;
  TextEditingController controllerNickname;
  TextEditingController controllerAboutMe;
  String id = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl = '';
  var listMessage;
  String groupChatId;
  Workorder _workorder;
  bool isLoading = false;
  File avatarImageFile;
  final FocusNode focusNodeNickname = new FocusNode();
  final FocusNode focusNodeAboutMe = new FocusNode();
  File imageFile;
  bool isShowSticker;
  String imageUrl;

  final TextEditingController textEditingController =
      new TextEditingController();
  final ScrollController listScrollController = new ScrollController();
  final FocusNode focusNode = new FocusNode();

//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//  }

  @override
  void dispose() {
    _controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  List<Tab> _tabs = [
    Tab(icon: Icon(Icons.access_time), text: 'Time Sheets'),
    Tab(icon: Icon(Icons.timeline), text: 'Asset History'),
    Tab(icon: Icon(Icons.message), text: 'Messages'),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _bloc = AppStateProvider.of<AppState>(context).deviceBloc;
  }

  @override
  void initState() {
    // readLocal();
//    focusNode.addListener(onFocusChange);
    isShowSticker = false;

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 7),
    );

    animationController.repeat();

    _controller = new TabController(
      length: _tabs.length,
      initialIndex: 0,
      vsync: this,
    );
    super.initState();
  }

  Widget _lineItems(BuildContext context, Workorder workorder) {}

  Widget _buildTile(
      String type, double elevation, double borderRadius, Widget child,
      {Function() onTap}) {
    // (type == 'pay')
    //     ? onTap = () => Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => CheckoutScreen(_workorder)))
    //     : null;

    return Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(borderRadius),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()

            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }

  double reciprocal(double d) => 1 / d;

//  Widget _buildGridItems(BuildContext context, int index) {
//    int gridStateLength = 100;
//    int x, y = 0;
//    x = (index / gridStateLength).floor();
//    y = (index % gridStateLength);
//    return GestureDetector(
//      onTap: () => print('Not set yet'),
//      child: GridTile(
//        child: Container(
//          decoration: BoxDecoration(
//              border: Border.all(color: Colors.black, width: 0.5)),
//          child: Center(
//              child: Row(
//            children: <Widget>[
//              Text(_workorder.serviceItems[index].serviceName),
//              Text(_workorder.serviceItems[index].serviceName),
//              Text(_workorder.serviceItems[index].quantity.toString()),
//              Text((reciprocal(num.parse(_workorder.serviceItems[index].quantity
//                              .toString())
//                          .toDouble()) *
//                      num.parse(
//                          _workorder.serviceItems[index].price.toString()))
//                  .toString()),
//            ],
//          )),
//        ),
//      ),
//    );
//  }

  Widget _lineItemList(BuildContext context, Workorder workorder) {
    return FirestoreAnimatedList(
        query: Firestore.instance
            .collection("workorders")
            .document(workorder.orderID)
            .collection("lineItems")
            .snapshots(),
        itemBuilder: (
          BuildContext context,
          DocumentSnapshot snapshot,
          Animation<double> animation,
          int index,
        ) {
          LineItem result;
          if (snapshot.data != null) {
            result = serializers.deserializeWith<LineItem>(
                LineItem.serializer, snapshot.data);
            print(result);
          }
          return (result != null)
              ? FadeTransition(
                  opacity: animation,
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        flex: 2,
                                        child: Text(result.name,
                                            style: TextStyle(
                                                color: Color(
                                                    GSYColors.mainTextColor),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.0))),
                                    Container(width: 20),
                                    Expanded(
                                        flex: 5,
                                        child: Text(result.name,
                                            style: TextStyle(
                                                color: Color(
                                                    GSYColors.mainTextColor),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.0))),
                                    Spacer(),
                                    Container(width: 90),
                                    Expanded(
                                        flex: 1,
                                        child: Text(result.quantity.toString(),
                                            style: TextStyle(
                                                color: Color(
                                                    GSYColors.mainTextColor),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.0))),
                                    Container(width: 90),
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
                                  ],
                                )))
                      ])))
              : null;
        });
  }

  final makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.black))),
        child: Icon(Icons.autorenew, color: Colors.black),
      ),
      title: Text(
        "Introduction to Driving",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.black),
          Text(" Intermediate", style: TextStyle(color: Colors.black))
        ],
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0));

  Widget buildPage(BuildContext context, Workorder workorder) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            // makeHeader("asdf"),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 120.0,
                  alignment: Alignment.center,
                  child: _buildTile(
                      'pay',
                      14.0,
                      3.0,
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Material(
                                  color: Color(GSYColors.actionBlue),
                                  borderRadius: BorderRadius.circular(34.0),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: new Icon(Icons.home,
                                        color: Colors.white, size: 30.0),
                                  ))),
                              Container(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Customer',
                                      style: TextStyle(
                                          color: Color(GSYColors.actionBlue))),
                                  Text("Jones, Jimmy",
                                      style: TextStyle(
                                          color: Color(GSYColors.mainTextColor),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30.0))
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(workorder.orderID,
                                      style: TextStyle(
                                          color: Color(GSYColors.mainTextColor),
                                          fontSize: 24.0)),
                                  Spacer(),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Material(
                                            color: Colors.green.shade700,
                                            borderRadius:
                                                BorderRadius.circular(28.0),
                                            child: Center(
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(
                                                      // onTap: () => MaterialPageRoute(
                                                      //     builder: (context) =>
                                                      //         CheckoutScreen(
                                                      //             workorder)),
                                                      child: Icon(
                                                          Icons.money_off,
                                                          color: Colors.white,
                                                          size: 28.0),
                                                    )))),
                                      ])
                                ],
                              ),
                            ]),
                      )),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: _buildTile(
                        null,
                        14.0,
                        3.0,
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Material(
                              color: Color(GSYColors.actionBlue),
                              borderRadius: BorderRadius.circular(3),
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      // Container(width: 10),
                                      Text('Line Items',
                                          style: TextStyle(
                                              color: Color(GSYColors.white),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24.0)),
                                    ],
                                  ))),
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: _buildTile(
                        null,
                        0.0,
                        0.0,
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Text('Item',
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0))),
                                  Expanded(flex: 1, child: Container(width: 1)),
                                  Expanded(
                                      flex: 5,
                                      child: Text('Desc',
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0))),
                                  Expanded(flex: 2, child: Container(width: 1)),
                                  Expanded(
                                      flex: 1,
                                      child: Text('Qty',
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0))),
                                  Expanded(
                                      flex: 1,
                                      child: Text('Amt',
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0))),
                                ],
                              )),
                        )),
                  )),

              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 170.00,
                    alignment: Alignment.center,
                    child: _buildTile(
                      null,
                      0.0,
                      0.0,
                      _lineItemList(context, workorder),
                    ),
                  )),

              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 160,
                    alignment: Alignment.center,
                    child: _buildTile(
                        null,
                        6.0,
                        0.0,
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      // Container(width: 10),
                                      Text('Discount %',
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.0)),
                                      Spacer(),
                                      Text(workorder.discountPercent.toString(),
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.0)),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      // Container(width: 10),
                                      Text('Subtotal',
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.0)),
                                      Spacer(),
                                      Text(workorder.discountPercent.toString(),
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.0)),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      // Container(width: 10),
                                      Text('Tax',
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.0)),
                                      Spacer(),
                                      Text(workorder.discountPercent.toString(),
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.0)),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      // Container(width: 10),
                                      Text('Total',
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0)),
                                      Spacer(),
                                      Text(workorder.discountPercent.toString(),
                                          style: TextStyle(
                                              color: Color(
                                                  GSYColors.mainTextColor),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0)),
                                    ],
                                  ),
                                ]))),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: _buildTile(
                        null,
                        14.0,
                        3.0,
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Material(
                              color: Color(GSYColors.actionBlue),
                              borderRadius: BorderRadius.circular(3),
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      // Container(width: 10),
                                      Text('Balance Due',
                                          style: TextStyle(
                                              color: Color(GSYColors.white),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24.0)),
                                      Spacer(),
                                      Text(workorder.balanceDue.toString(),
                                          style: TextStyle(
                                              color: Color(GSYColors.white),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24.0)),
                                    ],
                                  ))),
                        )),
                  )),
              Card(
                child: Column(
                  children: [
                    Container(
                      color: Color(GSYColors.actionBlue),
                      child: ListTile(
                        title: Text('Notes',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(GSYColors.textWhite))),
                        subtitle: Text('Job notes (public)',
                            style: TextStyle(
                                // fontWeight: FontWeight.w500,
                                color: Color(GSYColors.textWhite))),
                        leading: Icon((Icons.note_add),
                            color: Color(GSYColors.textWhite)),
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      maxLines: 5,
                      decoration: new InputDecoration(
                        // labelText: "Enter Email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(2.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    // title: Text('(408) 555-1212',
                    //     style: TextStyle(fontWeight: FontWeight.w500)),
                    // leading: Icon(
                    //   Icons.contact_phone,
                    //   color: Colors.blue[500],
                    // ),
                  ],
                ),
              ),
              //                 ],
              //                 staggeredTiles: [
              //                   StaggeredTile.extent(2, 110.0),
              //                   StaggeredTile.extent(2, 40.0),
              //                   StaggeredTile.extent(2, 40.0),
              //                   StaggeredTile.extent(2, 220.0),
              //                   StaggeredTile.extent(2, 140.0),
              //                   // StaggeredTile.extent(2, 40.0),
              //                 ],
              //               ),
              //             ),
              //           ]),
              //     )
              //     // ),
              //     // ),
              //     // BodyWidget(Colors.green),
              //     // BodyWidget(Colors.orange),
              //     // BodyWidget(Colors.blue),
              //     // BodyWidget(Colors.red),
              //     )
            ])),

            // SliverGrid(
            //   gridDelegate:
            //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            //   delegate: SliverChildListDelegate(
            //     [
            //       BodyWidget(Colors.blue),
            //       BodyWidget(Colors.green),
            //       BodyWidget(Colors.yellow),
            //       BodyWidget(Colors.orange),
            //       BodyWidget(Colors.blue),
            //       BodyWidget(Colors.red),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildPage(context, widget.order);
//    final WorkordersBloc bloc = Provider.of<AppState>(context).workordersBloc;
//    // bloc.setCurrentWorkorder(widget.workorderId);
//    return StreamBuilder<Workorder>(
//        stream: bloc.getWorkorder(widget.workorderId),
//        builder: (BuildContext context, AsyncSnapshot<Workorder> snapshot) {
//          if (snapshot.connectionState == ConnectionState.active) {
//            if (!snapshot.hasData || snapshot.hasError) return LoadingWidget();
//            Workorder workorder = snapshot.data;
//            _workorder = workorder;
//            return buildPage(context, widget.order;
//          } else {
//            return LoadingWidget();
//          }
//        });
  }
}

class HeaderWidget extends StatelessWidget {
  final String text;

  HeaderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(text),
      color: Colors.grey[200],
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Color color;

  BodyWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: color,
      alignment: Alignment.center,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class IconButtonText extends StatelessWidget {
  IconButtonText(
      {@required this.onClick,
      @required this.iconData,
      @required this.text,
      this.selected});

  final VoidCallback onClick;

  final IconData iconData;
  final String text;

  bool selected = false;

  final Color selectedColor = new Color(0xff283593);

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
      onTap: onClick,
      child: new Column(
        children: <Widget>[
          new Icon(
            iconData,
            color: Colors.black,
          ),
          new Text(
            text,
            style: new TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
//   return Scaffold(
//       body: Padding(
//           padding: EdgeInsets.only(top: 40),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: StaggeredGridView.count(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 12.0,
//                     mainAxisSpacing: 6.0,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//                     children: <Widget>[
//                       _buildTile(
//                         14.0,
//                         3.0,
//                         Padding(
//                           padding: const EdgeInsets.all(24.0),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 Material(
//                                     color: Color(GSYColors.actionBlue),
//                                     borderRadius: BorderRadius.circular(34.0),
//                                     child: Center(
//                                         child: Padding(
//                                       padding: const EdgeInsets.all(18.0),
//                                       child: new Icon(FontAwesomeIcons.home,
//                                           color: Colors.white, size: 30.0),
//                                     ))),
//                                 Container(width: 20),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Text('Customer',
//                                         style: TextStyle(
//                                             color:
//                                                 Color(GSYColors.actionBlue))),
//                                     Text("Jones, Jimmy",
//                                         style: TextStyle(
//                                             color: Color(
//                                                 GSYColors.mainTextColor),
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 30.0))
//                                   ],
//                                 ),
//                                 Spacer(),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Text(workorder.orderNumber,
//                                         style: TextStyle(
//                                             color: Color(
//                                                 GSYColors.mainTextColor),
//                                             fontSize: 24.0)),
//                                     Spacer(),
//                                   ],
//                                 ),
//                               ]),
//                         ),
//                       ),
//                       _buildTile(
//                           14.0,
//                           3.0,
//                           Padding(
//                             padding: const EdgeInsets.all(0.0),
//                             child: Material(
//                                 color: Color(GSYColors.actionBlue),
//                                 borderRadius: BorderRadius.circular(3),
//                                 child: Padding(
//                                     padding:
//                                         const EdgeInsets.only(left: 10.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: <Widget>[
//                                         // Container(width: 10),
//                                         Text('Line Items',
//                                             style: TextStyle(
//                                                 color: Color(GSYColors.white),
//                                                 fontWeight: FontWeight.w500,
//                                                 fontSize: 24.0)),
//                                       ],
//                                     ))),
//                           )),
//                       // _buildTile(
//                       //     0.0,
//                       //     0.0,
//                       //     Padding(
//                       //       padding: const EdgeInsets.all(8.0),
//                       //       child: Padding(
//                       //           padding: const EdgeInsets.only(left: 10.0),
//                       //           child: Row(
//                       //             mainAxisAlignment:
//                       //                 MainAxisAlignment.spaceBetween,
//                       //             crossAxisAlignment: CrossAxisAlignment.center,
//                       //             children: <Widget>[
//                       //               Expanded(
//                       //                   flex: 2,
//                       //                   child: Text('Item',
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w600,
//                       //                           fontSize: 14.0))),
//                       //               Expanded(flex: 1, child: Container(width: 1)),
//                       //               Expanded(
//                       //                   flex: 5,
//                       //                   child: Text('Desc',
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w600,
//                       //                           fontSize: 14.0))),
//                       //               Expanded(flex: 2, child: Container(width: 1)),
//                       //               Expanded(
//                       //                   flex: 1,
//                       //                   child: Text('Qty',
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w600,
//                       //                           fontSize: 14.0))),
//                       //               Expanded(
//                       //                   flex: 1,
//                       //                   child: Text('Amt',
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w600,
//                       //                           fontSize: 14.0))),
//                       //             ],
//                       //           )),
//                       //     )),
//                       // _buildTile(
//                       //   0.0,
//                       //   0.0,
//                       //   _lineItemList(context, workorder),
//                       // ),
//                       // _buildTile(
//                       //     6.0,
//                       //     0.0,
//                       //     Padding(
//                       //         padding: const EdgeInsets.all(8.0),
//                       //         child: Column(
//                       //             mainAxisAlignment:
//                       //                 MainAxisAlignment.spaceBetween,
//                       //             children: <Widget>[
//                       //               Row(
//                       //                 mainAxisAlignment: MainAxisAlignment.start,
//                       //                 crossAxisAlignment:
//                       //                     CrossAxisAlignment.center,
//                       //                 children: <Widget>[
//                       //                   // Container(width: 10),
//                       //                   Text('Discount %',
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w400,
//                       //                           fontSize: 16.0)),
//                       //                   Spacer(),
//                       //                   Text(workorder.discountPercent,
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w400,
//                       //                           fontSize: 16.0)),
//                       //                 ],
//                       //               ),
//                       //               Row(
//                       //                 mainAxisAlignment: MainAxisAlignment.start,
//                       //                 crossAxisAlignment:
//                       //                     CrossAxisAlignment.center,
//                       //                 children: <Widget>[
//                       //                   // Container(width: 10),
//                       //                   Text('Subtotal',
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w400,
//                       //                           fontSize: 16.0)),
//                       //                   Spacer(),
//                       //                   Text(workorder.discountPercent,
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w400,
//                       //                           fontSize: 16.0)),
//                       //                 ],
//                       //               ),
//                       //               Row(
//                       //                 mainAxisAlignment: MainAxisAlignment.start,
//                       //                 crossAxisAlignment:
//                       //                     CrossAxisAlignment.center,
//                       //                 children: <Widget>[
//                       //                   // Container(width: 10),
//                       //                   Text('Tax',
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w400,
//                       //                           fontSize: 16.0)),
//                       //                   Spacer(),
//                       //                   Text(workorder.discountPercent,
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w400,
//                       //                           fontSize: 16.0)),
//                       //                 ],
//                       //               ),
//                       //               Row(
//                       //                 mainAxisAlignment: MainAxisAlignment.start,
//                       //                 crossAxisAlignment:
//                       //                     CrossAxisAlignment.center,
//                       //                 children: <Widget>[
//                       //                   // Container(width: 10),
//                       //                   Text('Total',
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w600,
//                       //                           fontSize: 18.0)),
//                       //                   Spacer(),
//                       //                   Text(workorder.discountPercent,
//                       //                       style: TextStyle(
//                       //                           color: Color(
//                       //                               GSYColors.mainTextColor),
//                       //                           fontWeight: FontWeight.w600,
//                       //                           fontSize: 18.0)),
//                       //                 ],
//                       //               ),
//                       //             ]))),
//                     ],
//                     staggeredTiles: [
//                       StaggeredTile.extent(2, 110.0),
//                       StaggeredTile.extent(2, 40.0),
//                       // StaggeredTile.extent(2, 40.0),
//                       // StaggeredTile.extent(2, 220.0),
//                       // StaggeredTile.extent(2, 140.0),
//                       // StaggeredTile.extent(2, 40.0),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                     flex: 2,
//                     child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               ConstrainedBox(
//                                 constraints:
//                                     BoxConstraints.expand(height: 20),
//                                 child: Padding(
//                                     padding:
//                                         const EdgeInsets.only(left: 10.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: <Widget>[
//                                         Expanded(
//                                             flex: 2,
//                                             child: Text('Item',
//                                                 style: TextStyle(
//                                                     color: Color(GSYColors
//                                                         .mainTextColor),
//                                                     fontWeight:
//                                                         FontWeight.w600,
//                                                     fontSize: 14.0))),
//                                         Expanded(
//                                             flex: 1,
//                                             child: Container(width: 1)),
//                                         Expanded(
//                                             flex: 5,
//                                             child: Text('Desc',
//                                                 style: TextStyle(
//                                                     color: Color(GSYColors
//                                                         .mainTextColor),
//                                                     fontWeight:
//                                                         FontWeight.w600,
//                                                     fontSize: 14.0))),
//                                         Expanded(
//                                             flex: 2,
//                                             child: Container(width: 1)),
//                                         Expanded(
//                                             flex: 1,
//                                             child: Text('Qty',
//                                                 style: TextStyle(
//                                                     color: Color(GSYColors
//                                                         .mainTextColor),
//                                                     fontWeight:
//                                                         FontWeight.w600,
//                                                     fontSize: 14.0))),
//                                         Container(width: 90),
//                                         Expanded(
//                                             flex: 1,
//                                             child: Text('Amt',
//                                                 style: TextStyle(
//                                                     color: Color(GSYColors
//                                                         .mainTextColor),
//                                                     fontWeight:
//                                                         FontWeight.w600,
//                                                     fontSize: 14.0))),
//                                       ],
//                                     )),
//                               ),
//                               Expanded(
//                                   flex: 1,
//                                   child: _buildTile(
//                                     0.0,
//                                     0.0,
//                                     _lineItemList(context, workorder),
//                                   ))
//                             ]))),
//                 Expanded(
//                     child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   // Container(width: 10),
//                                   Text('Discount %',
//                                       style: TextStyle(
//                                           color:
//                                               Color(GSYColors.mainTextColor),
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16.0)),
//                                   Spacer(),
//                                   Text(workorder.discountPercent,
//                                       style: TextStyle(
//                                           color:
//                                               Color(GSYColors.mainTextColor),
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16.0)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   // Container(width: 10),
//                                   Text('Subtotal',
//                                       style: TextStyle(
//                                           color:
//                                               Color(GSYColors.mainTextColor),
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16.0)),
//                                   Spacer(),
//                                   Text(workorder.discountPercent,
//                                       style: TextStyle(
//                                           color:
//                                               Color(GSYColors.mainTextColor),
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16.0)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   // Container(width: 10),
//                                   Text('Tax',
//                                       style: TextStyle(
//                                           color:
//                                               Color(GSYColors.mainTextColor),
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16.0)),
//                                   Spacer(),
//                                   Text(workorder.discountPercent,
//                                       style: TextStyle(
//                                           color:
//                                               Color(GSYColors.mainTextColor),
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 16.0)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   // Container(width: 10),
//                                   Text('Total',
//                                       style: TextStyle(
//                                           color:
//                                               Color(GSYColors.mainTextColor),
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 18.0)),
//                                   Spacer(),
//                                   Text(workorder.discountPercent,
//                                       style: TextStyle(
//                                           color:
//                                               Color(GSYColors.mainTextColor),
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 18.0)),
//                                 ],
//                               ),
//                             ]))
//                     // Expanded(
//                     //   child: _lineItemList(context, workorder),
//                     // )
//                     ),
//                 ConstrainedBox(
//                   constraints: BoxConstraints.expand(height: 50),
//                   child: _buildTile(
//                       14.0,
//                       3.0,
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                         child: Material(
//                             color: Color(GSYColors.actionBlue),
//                             borderRadius: BorderRadius.circular(3),
//                             child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 4.0, right: 10.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.center,
//                                   children: <Widget>[
//                                     // Container(width: 10),
//                                     Text('Balance Due',
//                                         style: TextStyle(
//                                             color: Color(GSYColors.white),
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 20.0)),
//                                     Spacer(),
//                                     Text(workorder.balanceDue,
//                                         style: TextStyle(
//                                             color: Color(GSYColors.white),
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 20.0)),
//                                   ],
//                                 ))),
//                       )),
//                 ),
//                 ConstrainedBox(
//                     constraints: BoxConstraints.expand(height: 150),
//                     child: Card(
//                         child: Column(
//                       children: [
//                         ListTile(
//                           title: Text('1625 Main Street',
//                               style: TextStyle(fontWeight: FontWeight.w500)),
//                           subtitle: Text('My City, CA 99984'),
//                           leading: Icon(
//                             Icons.restaurant_menu,
//                             color: Colors.blue[500],
//                           ),
//                         ),
//                         Divider(),
//                         ListTile(
//                           title: Text('(408) 555-1212',
//                               style: TextStyle(fontWeight: FontWeight.w500)),
//                           leading: Icon(
//                             Icons.contact_phone,
//                             color: Colors.blue[500],
//                           ),
//                         ),
//                         ListTile(
//                           title: Text('costa@example.com'),
//                           leading: Icon(
//                             Icons.contact_mail,
//                             color: Colors.blue[500],
//                           ),
//                         ),
//                       ],
//                     ))),
//                 // SizedBox(height: 30.0),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: <Widget>[
//                 //     // Expanded(flex: 1, child: levelIndicator),
//                 //     // Expanded(
//                 //     //     flex: 6,
//                 //     //     child: Padding(
//                 //     //         padding: EdgeInsets.only(left: 10.0),
//                 //     //         child: Text(
//                 //     //           lesson.level,
//                 //     //           style: TextStyle(color: Colors.white),
//                 //     //         ))),
//                 //     // Expanded(flex: 1, child: coursePrice)
//                 //   ],
//                 // ),
//               ])));
// }
