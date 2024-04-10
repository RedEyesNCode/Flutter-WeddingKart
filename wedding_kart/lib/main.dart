import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wedding Kart'),
      ),


      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,

        children:[Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.white60,
              elevation: 5,

              child:
              Padding(padding: EdgeInsets.all(50),
                child:  Column(
                  children: [
                    Text("Login",textAlign: TextAlign.center,style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 24),),
                  ],
                ),


              )
             ,

            )
          ],
        )] ,
      ),
    );
  }
}

