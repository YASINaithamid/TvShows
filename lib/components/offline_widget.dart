import 'package:flutter/material.dart';

class OfflineMsg extends StatelessWidget {
  final String? message;
  final String? title;
  const OfflineMsg({required this.message, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text(title!),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(10.00),
        margin: EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(right: 6.00),
            child: Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text(message!, style: TextStyle(color: Colors.white)),
          //show error message text
        ]),
      ),
    );
  }
}
