import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/src/view/screens/DashboardScreen.dart';
import 'package:wedding_kart/src/view/screens/RegisterScreen.dart';

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
    builder: (BuildContext dialogContext) { // Changed context to dialogContext
      return AlertDialog(
        title: Text("Info",style: TextStyle(
          color: Colors.black,
          fontFamily: 'PlayfairDisplay',
          fontWeight: FontWeight.w400,
          fontSize: 18,)),
        content: Text("Email or password cannot be empty.",style: TextStyle(
            color: Colors.black,
            fontFamily: 'PlayfairDisplay',
            fontWeight: FontWeight.w400,
            fontSize: 18,)),
        actions: [
          TextButton(
            child: Text("OK",style: TextStyle(
                color: Colors.redAccent,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w600,
                fontSize: 20),),
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Use the dialogContext here
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

                              if(email.isEmpty){
                                showAlertDialog(context);


                              }else if(password.isEmpty){
                                showAlertDialog(context);


                              } else{
                                //navigate to dashboard screen
                                print("Text field value: ${_controllerEmail.text} & ${_controllerPassword.text}");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                                );
                              }
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
                            SizedBox(height: 20,),
                            Stack(
                              alignment: Alignment.center,
                              children: [

                                Padding(padding: EdgeInsets.all(10),child:

                                Text(
                                  "OR",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(

                                      color: Colors.redAccent,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 23),
                                ),)

                              ],
                            ),
                            SizedBox(height: 12,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(left: 35,right: 35,top: 10,bottom: 10))// Set your desired color
                                  ),                              onPressed: () {
                                  try {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                                    );
                                  } catch (e) {
                                    print('Failed to navigate: $e');
                                  }
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
