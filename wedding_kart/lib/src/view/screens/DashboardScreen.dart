import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreenUI(),
    );
  }

}

class DashboardScreenUI extends StatefulWidget {

  @override
  _DashboardScreenUI createState() => _DashboardScreenUI();
}

class _DashboardScreenUI extends State<DashboardScreenUI>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wedding Kart",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
        backgroundColor: Colors.redAccent,

      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Dashboard")],
      ),
    );


  }

}