import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TwoWordHeader extends StatelessWidget {
  final List<String> wordList;

  TwoWordHeader({Key key, this.wordList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
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
                      wordList[0],
                      style: new TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      wordList[1],
                      style: new TextStyle(fontSize: 28.0, color: Colors.grey),
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
    );
  }
}
