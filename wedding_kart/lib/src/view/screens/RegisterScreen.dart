import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/main.dart';
import 'package:wedding_kart/src/view/screens/DashboardScreen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreenUI(),
    );
  }
}

void showAlertDialog(BuildContext context, String message) {
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
        content: Text(message,
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

class RegisterScreenUI extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreenUI> {
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
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                } catch (e) {
                  print('Failed to navigate: $e');
                }
              },
              child: Text('Login',
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context)
              .size
              .height, // Set height to fill the screen
           // Set width to fill the screen
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
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://img2.sangam.com/assets/home/HomePage_Default_Final.webp',
                    fit: BoxFit.cover,
                    height: 200, // Adjust the height of the image as needed
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Search for Matches who speak",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'PlayfairDisplay',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: TextField(
                                            controller: _controllerFullName,
                                            decoration: InputDecoration(
                                              labelText: 'Mother Tongue*',
                                              hintText: '',
                                              helperText: '',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                "And Belongs to",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily:
                                                        'PlayfairDisplay',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: TextField(
                                            controller: _controllerEmail,
                                            decoration: InputDecoration(
                                              labelText: 'Community *',
                                              hintText: '',
                                              helperText: '',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width:
                                                  null, // Set your desired width
                                              height:
                                                  50, // Set your desired height
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        109, 36, 81, 1),
                                                    Color.fromRGBO(
                                                        146, 29, 38, 1)
                                                  ], // Adjust colors as needed
                                                ),
                                              ),
                                              child: TextButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(Colors
                                                                .transparent),
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
                                                  // Step 4: Use the controller to do something with the input
                                                  var email = _controllerEmail
                                                      .text
                                                      .toString();
                                                  var password =
                                                      _controllerPassword.text
                                                          .toString();
                                                  var fullName =
                                                      _controllerFullName.text
                                                          .toString();

                                                  if (fullName.isEmpty) {
                                                    showAlertDialog(context,
                                                        "Please enter full name");
                                                  } else if (email.isEmpty) {
                                                    showAlertDialog(context,
                                                        "Please enter email address");
                                                  } else if (password.isEmpty) {
                                                    showAlertDialog(context,
                                                        "Please enter password");
                                                  } else {
                                                    // Navigate to DashboardScreen
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DashboardScreen()),
                                                    );
                                                  }

                                                  print(
                                                      "Text field value: ${_controllerEmail.text} & ${_controllerPassword.text}");
                                                },
                                                child: Text(
                                                  "Let's Begin",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'PlayfairDisplay',
                                                      fontWeight:
                                                          FontWeight.w800,
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
                      )
                    ],
                  )
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [
              //         Color.fromRGBO(109, 36, 81, 1),
              //         Color.fromRGBO(146, 29, 38, 1)
              //       ], // Adjust colors as needed
              //     ),
              //   ),
              //   child:
              //
              //
              //   Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       _buildSection("Why choose Wedding Star ?", "Genuine Profiles | Safe & Secure | \n  Detailed Family Information", 21, 14),
              //       _buildSection("Get Complete Family Information", "You will find detailed family information in every profile. \n Knowing the family \n will help you take the next step with confidence.", 17, 14),
              //
              //     ],
              //   ),
              // )

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, double titleFontSize, double descriptionFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white],
            ),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w700,
                fontSize: titleFontSize,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white],
            ),
          ),
          child: Text(
            description,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w700,
              fontSize: descriptionFontSize,
            ),
          ),
        ),
      ],
    );
  }
}
