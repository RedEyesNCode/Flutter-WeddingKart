import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreenUI(),
    );
  }
}

class RegisterScreenUI extends StatefulWidget{

  @override
  _RegisterScreenState createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreenUI>{

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerFullName = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Optional: Set an initial value
    _controllerEmail.text = "";
    _controllerPassword.text = "";
    _controllerFullName.text = "";


  }
  @override
  void dispose() {
    // Step 2: Dispose of the controller
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerFullName.dispose();


    super.dispose();
  }

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
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: null,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: Text(
                                    "Create New Account ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Enter Full Name",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(left: 10),child:
                            TextField(
                              controller: _controllerFullName,
                              decoration: InputDecoration(labelText: ''),
                            ),),
                            SizedBox(height: 20,),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Enter Email",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(left: 10),child:
                            TextField(
                              controller: _controllerEmail,
                              decoration: InputDecoration(labelText: ''),
                            ),),
                            SizedBox(height: 20,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 10),child:
                                Text(
                                  "Enter Password",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),)

                              ],
                            ),
                            Padding(padding: EdgeInsets.only(left: 10),child:
                            TextField(
                              controller: _controllerPassword,
                              decoration: InputDecoration(labelText: ''),
                            ),),
                            SizedBox(height: 50,),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(left: 35,right: 35,top: 10,bottom: 10))// Set your desired color
                                  ),                              onPressed: () {
                                  // Step 4: Use the controller to do something with the input
                                  var email = _controllerEmail.text.toString();
                                  var password = _controllerPassword.text.toString();

                                  print("Text field value: ${_controllerEmail.text} & ${_controllerPassword.text}");
                                },
                                  child: Text(
                                    "Create New Account",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.w800,

                                        fontSize: 21),
                                  ),
                                ),


                              ],
                            )



                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}