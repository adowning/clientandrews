import 'package:flutter/material.dart';

import 'package:clientandrews/models/account.dart';

class CustomerCardView extends StatelessWidget {
  final Account account;
  CustomerCardView(this.account);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: Row(children: <Widget>[
        Image.asset(
          'assets/unknown-home.png',
          height: 130,
          width: 130,
        ),
        SizedBox(
          width: 25.0,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          Text(
            account.accountName,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            account.phone1,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
          ),

          // SizedBox(
          //   height: 5.0,
          // ),
          Text(
            account.address1,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
          ),
          Text(
            account.city + ', ' + account.state + ' ' + account.zip.toString(),
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
            // TextSpan(text: ' world!'),
          ),
        ]),
        SizedBox(
          width: 15.0,
        ),
        // Spacer(),
        // Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        //   Icon(Icons.edit, size: 30),
        // SizedBox(
        //   height: 5.0,
        // ),
        // Text(
        //   account.phone1,
        //   style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
        // ),

        // Text(
        //   account.address1,
        //   style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
        // ),
        // Text(
        //   account.city + ', ' + account.state + ' ' + account.zip.toString(),
        //   style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
        //   // TextSpan(text: ' world!'),
        // ),
        // ]),
      ]),
      //  Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.max,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: <Widget>[
      //         Text("asdf")
      //         // Image.asset(
      //         //   'assets/unknown-home.png',
      //         //   height: 100,
      //         //   width: 100,
      //         // ),
      //         // Column(
      //         //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //         //   children: <Widget>[
      //         //     Text(
      //         //       account.accountName,
      //         //       style: TextStyle(
      //         //           fontWeight: FontWeight.w700, fontSize: 20.0),
      //         //     ),
      //         //     SizedBox(
      //         //       height: 10.0,
      //         //     ),
      //         //     Text(account.phone1),
      //         //     SizedBox(
      //         //       height: 10.0,
      //         //     ),
      //         //     Row(
      //         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         //       children: <Widget>[
      //         //         // Text(  widget.newJob.customer.address.streetAddress + widget.newJob.customer.address.city + widget.newJob.customer.address.state + widget.newJob.customer.address.zipcode),
      //         //         (account.address1 != null)
      //         //             ? Text(account.address1)
      //         //             : Text(
      //         //                 "Due 02/25/2019",
      //         //                 style: TextStyle(
      //         //                     color: Colors.orange.shade800,
      //         //                     fontWeight: FontWeight.w700,
      //         //                     fontSize: 15.0),
      //         //               )
      //         //       ],
      //         //     )
      //         //   ],
      //         // ),
      //       ],
      //     ))
    );
  }
}
