import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/main.dart';
import 'package:wedding_kart/src/view/screens/CreateUserScreen.dart';
import 'package:wedding_kart/src/view/screens/DashboardScreen.dart';
import 'package:wedding_kart/src/view/screens/UpdateSocialScreen.dart';
import 'package:wedding_kart/src/view/widgets/CustomCardWidget.dart';
import 'package:wedding_kart/src/view/widgets/ImageCard.dart';
import 'package:wedding_kart/src/view/widgets/OptionsSheet.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RegisterScreenUI();
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
  final TextEditingController _controllerMotherTongue = TextEditingController();
  final TextEditingController _controllerCommunity = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Optional: Set an initial value
    _controllerMotherTongue.text = "";
    _controllerCommunity.text = "";
  }

  @override
  void dispose() {
    // Step 2: Dispose of the controller
    _controllerMotherTongue.dispose();
    _controllerCommunity.dispose();

    super.dispose();
  }
  void _showBottomSheetMotherTongue(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["Hindi", "Marathi", "Punjabi", "Bengali", "Gujrati", "Telugu","Tamil","Urdu","Kannada","Odia","Malayalam","English"],
        onItemSelected: (selectedItem) {
          _controllerMotherTongue.text = selectedItem;
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showBottomSheetCommunity(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["Hindu-Maratha", "Hindu-Rajput", "Hindu-Brahmin", "Hindu-Yadav", "Hindu-Agarwal", "Hindu-Baniya","Hindu-Jat","Sikh-Jat","Muslim-Sunni","Buddhish-Buddhish","Hindu-Kayastha"],
        onItemSelected: (selectedItem) {
          _controllerCommunity.text = selectedItem;
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios),color: Colors.white,),
            Text(
              "Wedding Star !",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Container(

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
                                            controller: _controllerMotherTongue,
                                            onTap: () {
                                              _showBottomSheetMotherTongue(context);
                                            },

                                            canRequestFocus: false,
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
                                            controller: _controllerCommunity,
                                            onTap: () {
                                              _showBottomSheetCommunity(context);
                                            },

                                            canRequestFocus: false,
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
                                                  if(_controllerMotherTongue.text.isEmpty){
                                                    showAlertDialog(context, 'Please select mother tongue');

                                                  }else if(_controllerCommunity.text.isEmpty){

                                                    showAlertDialog(context, 'Please select your community');

                                                  }else{
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => CreateUserScreen()),
                                                    );
                                                  }

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
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ], // Adjust colors as needed
                  ),
                ),
                child:




                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildSection("Why choose Wedding Star ?", "Genuine Profiles | Safe & Secure | \n  Detailed Family Information", 21, 14),
                    _buildSection("Get Complete Family Information", "You will find detailed family information in every profile. \n Knowing the family \n will help you take the next step with confidence.", 17, 14),
                    _buildSection("Get Matches from your Community", "With over 80 community sites, you can find a \n Match from your community.Finding a Match based on caste and religion made easy.", 17, 14),
                    _buildSection("Enable your search without any barrier", "Embark on your journey to find your perfect match now available in multiple languages", 17, 14),

                    ImageCard(imageUrl: 'https://static.toiimg.com/imagenext/toiblogs/photo/readersblog/wp-content/uploads/2020/04/Indian-Bride-Feature-Image.jpg',text: 'Play our new TV Ad'),
                    _buildSection("Over 40,000+ Happy Stories", "Embark on your journey to find your perfect match now available in multiple languages", 21, 14),
                    CustomCardWidget(imageUrl: 'https://img.weddingbazaar.com/shaadisaga_production/photos/pictures/006/796/410/new_medium/page.jpg?1684837759', title: 'Mehnaz Fatima & Syed Rizwan Hashmi', description: 'My brother has created my profile on Shaadi.com. I was not actually using my profile.')
                  ],
                ),
              ),

              Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'About Wedding Star', // Title from parameters
                        style: TextStyle(
                          fontSize: 24, // Big font size
                          fontWeight: FontWeight.bold,
                          color: Colors.white,

                        ),
                      ),

                      Text(
                        textAlign: TextAlign.center,
                        'Sangam is a trusted matchmaking service created for parents who are looking for a life partner for their loved ones.Unlike other Materimonial Services, we focus on providing trustworthy detailed family and background information to help you take the next step with confidence.', // Title from parameters
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12, // Big font size
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20,),
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

              )

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
