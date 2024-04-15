import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/src/model/RegisterResponse.dart';
import 'package:wedding_kart/src/view/screens/DashboardScreen.dart';
import 'package:wedding_kart/src/view/screens/RegisterScreen.dart';
import 'package:wedding_kart/src/viewmodel/UserViewModel.dart';
import 'package:provider/provider.dart';

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
    builder: (BuildContext dialogContext) {
      // Changed context to dialogContext
      return AlertDialog(
        title: Text("Info",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w400,
              fontSize: 18,
            )),
        content: Text("Email or password cannot be empty.",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w400,
              fontSize: 18,
            )),
        actions: [
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Use the dialogContext here
            },
          ),
        ],
      );
    },
  );
}

class _HomeScreenState extends State<HomeScreen> {
  // Step 1: Declare a TextEditingController
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool _isEmail = true;
  bool _isNumber = false;
  String _textButtonToggle = "Login with Number";

  void toggleVisibility() {
    setState(() {
      _isEmail = !_isEmail;
      _isNumber = !_isNumber;

      if (_isEmail) {
        _textButtonToggle = "Login with Number";
      } else {
        _textButtonToggle = "Login with Email";
      }
    });
  }

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
    final Map<String, dynamic> userData = {
      'email': 'test@gmail.com',
      'password': 'pass11',
      // Add other user data fields as needed
    };
    void _handleSuccess(RegisterResponse response) {
      // Access properties of the response and handle success
      print('Registration successful: ${response.message}');
      // Navigate to another screen, show a success message, etc.
    }

    void _handleError(dynamic error) {
      // Handle error
      print('Registration failed: $error');
      // Show an error message to the user, retry registration, etc.
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Wedding Star",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your registration logic here
                try {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                } catch (e) {
                  print('Failed to navigate: $e');
                }
              },
              child: Text('Register',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.redAccent,
      ),
      body:

          ChangeNotifierProvider
            (
            create: (context) => UserViewModel(),
            child:       SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height, // Set height to fill the screen
                width: MediaQuery.of(context).size.width, // Set width to fill the screen
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(109, 36, 81, 1),
                      Color.fromRGBO(146, 29, 38, 1)
                    ], // Adjust colors as needed
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 350,
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5, right: 20, top: 20),
                                            child: Text(
                                              "Welcome back!",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
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
                                          if (_isEmail)
                                            const Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Enter your email to login in",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'PlayfairDisplay',
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          if (_isNumber)
                                            const Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Enter your mobile to log in",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'PlayfairDisplay',
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 16),
                                              ),
                                            )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      if (_isEmail)
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: TextField(
                                            controller: _controllerEmail,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Email Address',
                                              hintText: '',
                                              helperText: '',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      if (_isNumber)
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: TextField(
                                            controller: _controllerEmail,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Mobile Number',
                                              hintText: '',
                                              helperText: '',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Enter Password",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'PlayfairDisplay',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: TextField(
                                          controller: _controllerPassword,
                                          decoration: InputDecoration(
                                            labelText: 'Enter Password',
                                            hintText: '',
                                            helperText: '',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 300, // Set your desired width
                                            height: 50, // Set your desired height
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color.fromRGBO(109, 36, 81, 1),
                                                  Color.fromRGBO(146, 29, 38, 1)
                                                ], // Adjust colors as needed
                                              ),
                                            ),
                                            child:

                                            ChangeNotifierProvider(
                                              create: (_) => UserViewModel(), // Provide an instance of UserViewModel

                                              child: TextButton(
                                                style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<
                                                      OutlinedBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(15.0), // Set all corners to zero for square corners
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.transparent),
                                                  overlayColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.transparent),
                                                  foregroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.white),

                                                ),
                                                onPressed: () async {
                                                  // Step 4: Use the controller to do something with the input
                                                  var email =
                                                  _controllerEmail.text.toString();
                                                  var password =
                                                  _controllerPassword.text.toString();

                                                  if (email.isEmpty) {
                                                    showAlertDialog(context);
                                                  } else if (password.isEmpty) {
                                                    showAlertDialog(context);
                                                  } else {
                                                    //navigate to dashboard screen
                                                    // Call the login API
                                                    try {
                                                      final response = await Provider.of<UserViewModel>(context,listen: false).registerUser(userData);


                                                      // Handle success
                                                      _handleSuccess(response);
                                                    } catch (error) {
                                                      // Handle error
                                                      _handleError(error);
                                                    }

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
                                            ),

                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "OR",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontFamily: 'PlayfairDisplay',
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 23),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 300, // Set your desired width
                                            height: 50, // Set your desired height
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color.fromRGBO(109, 36, 81, 1),
                                                  Color.fromRGBO(146, 29, 38, 1)
                                                ], // Adjust colors as needed
                                              ),
                                            ),
                                            child: TextButton(
                                              style: ButtonStyle(

                                                  padding: MaterialStateProperty.all<
                                                      EdgeInsetsGeometry>(
                                                      EdgeInsets.only(
                                                          left: 35,
                                                          right: 35,
                                                          top: 10,
                                                          bottom:
                                                          10)) // Set your desired color
                                              ),
                                              onPressed: () {
                                                toggleVisibility();
                                              },
                                              child: Text(
                                                _textButtonToggle,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'PlayfairDisplay',
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 21),
                                              ),
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            'Contact us',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Container(
                          width: 2, // Adjust the width of the line as needed
                          height: 20, // Adjust the height of the line as needed
                          color: Colors.white, // Set the color of the line
                        ),
                        Expanded(
                          child: Text(
                            'Terms & Conditions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Container(
                          width: 2, // Adjust the width of the line as needed
                          height: 20, // Adjust the height of the line as needed
                          color: Colors.white, // Set the color of the line
                        ),
                        Expanded(
                          child: Text(
                            'Privacy Policy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Container(
                          width: 2, // Adjust the width of the line as needed
                          height: 20, // Adjust the height of the line as needed
                          color: Colors.white, // Set the color of the line
                        ),
                        Expanded(
                          child: Text(
                            'Be safe online',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Passionately created by Megma IT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

          )
    );
  }
}
