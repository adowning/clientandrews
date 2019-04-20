import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  bool goBack = true;
  bool closePage = true;
  bool searchBar = false;
  bool hasIcon = true;
  final String returnRoute;
  final List<String> wordList;

  Color iconColor = Colors.green;

  CustomAppBar(
      {Key key,
      this.returnRoute,
      this.hasIcon,
      this.iconColor,
      this.goBack,
      this.searchBar,
      this.wordList,
      this.closePage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28, left: 10.0, right: 10.0),
      child:
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        (hasIcon)
            ? GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'settings');
                },
                child: new Image(
                    width: 35.0,
                    height: 35.0,
                    fit: BoxFit.cover,
                    image: new AssetImage('assets/icon.png')))
            : Container(width: 0, height: 0),
        // (hasIcon)
        //     ? new Image(
        //         width: 35.0,
        //         height: 35.0,
        //         fit: BoxFit.cover,
        //         image: new AssetImage('assets/icon.png'))
        //     : Container(width: 0, height: 0),

        Expanded(
            flex: 2,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  wordList[0],
                  style: new TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  wordList[1],
                  style: new TextStyle(fontSize: 28.0, color: Colors.grey),
                ),
              ],
            )),
        (closePage)
            ? GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.pushNamed(context, returnRoute);
                },
                child: new Icon(Icons.close, size: 45.0, color: iconColor))
            : Container(width: 45, height: 35),
            Container(width: 10),
      ]),
    );
  }
}
