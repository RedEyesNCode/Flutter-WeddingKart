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

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}
void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Info",style: TextStyle(fontFamily: 'PlayfairDisplay',fontSize: 20),),
        content: Text("Email or password cannot be empty.",style: TextStyle(fontFamily: 'PlayfairDisplay'),),
        actions: [
          TextButton(
            child: Text("OK",style:
              TextStyle(fontSize: 15,color: Colors.redAccent,fontWeight: FontWeight.w500,fontFamily: 'PlayfairDisplay'),),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
        ],
      );
    },
  );
}

class _HomeScreenState extends State<HomeScreen>{
  // Step 1: Declare a TextEditingController
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Optional: Set an initial value
    _controllerEmail.text = "";
    _controllerPassword.text = "";

  }
  @override
  void dispose() {
    // Step 2: Dispose of the controller
    _controllerEmail.dispose();
    _controllerPassword.dispose();

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
                height: 500,
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
                                    "Login to your Account",
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
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(left: 35,right: 35,top: 10,bottom: 10))// Set your desired color
                              ),                              onPressed: () {
                                // Step 4: Use the controller to do something with the input
                              var email = _controllerEmail.text.toString();
                              var password = _controllerPassword.text.toString();
                              if(email.isEmpty || password.isEmpty){
                                showAlertDialog(context);
                              }else{
                                //navigate to dashboard screen

                              }
                                print("Text field value: ${_controllerEmail.text} & ${_controllerPassword.text}");
                              },
                              child: Text(
                                "Login",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlayfairDisplay',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 21),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Divider(
                                  color: Colors.grey, // Customize color as needed
                                  thickness: 2, // Customize thickness as needed
                                  height: 20, // Customize height as needed
                                )
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
