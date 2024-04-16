import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/src/view/screens/UpdatePersonalScreen.dart';
import 'package:wedding_kart/src/view/widgets/OptionsSheet.dart';


class UpdateSocialScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return UpdateSocialScreenUI();
  }

}

class UpdateSocialScreenUI extends StatefulWidget{
  @override
  _UpdateSocialScreenState createState() => _UpdateSocialScreenState();

}

class _UpdateSocialScreenState extends State<UpdateSocialScreenUI>{
  final TextEditingController _controllerMotherTongue = TextEditingController();
  final TextEditingController _controllerCommunity = TextEditingController();
  final TextEditingController _controllerMartialStatus = TextEditingController();
  final TextEditingController _controllerCurrentLocation = TextEditingController();
  final TextEditingController _controllerFamilyLocation = TextEditingController();
  final TextEditingController _controllerNativePlace = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Optional: Set an initial value
    _controllerMotherTongue.text = "";
    _controllerCommunity.text = "";
    _controllerMartialStatus.text = "";
    _controllerCurrentLocation.text = "";
    _controllerFamilyLocation.text = "";
    _controllerNativePlace.text = "";
  }

  @override
  void dispose() {
    // Step 2: Dispose of the controller
    _controllerMotherTongue.dispose();
    _controllerCommunity.dispose();
    _controllerMartialStatus.dispose();
    _controllerCurrentLocation.dispose();
    _controllerFamilyLocation.dispose();
    _controllerNativePlace.dispose();


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

  void _showBottomSheetMartialStatus(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["NEVER_MARRIED","DIVORCED", "WIDOWED", "AWAITING_DIVORCE", "ANNULLED"],
        onItemSelected: (selectedItem) {
          _controllerMartialStatus.text = selectedItem;
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: Row(
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios),color: Colors.white,),
            Text(
              "Social Details",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body:
          SingleChildScrollView(
            child:  Column(

              children: [
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.all(10),
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
                SizedBox(height: 5,),

                Padding(
                  padding: EdgeInsets.all(10),
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
                SizedBox(height: 5,),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controllerMartialStatus,
                    onTap: () {
                      _showBottomSheetMartialStatus(context);
                    },

                    canRequestFocus: false,
                    decoration: InputDecoration(
                      labelText: 'Martial Status *',
                      hintText: '',
                      helperText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 5,),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controllerCurrentLocation,
                    decoration: InputDecoration(
                      labelText: 'Current Location *',
                      hintText: '',
                      helperText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 5,),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controllerFamilyLocation,
                    decoration: InputDecoration(
                      labelText: 'Family Location *',
                      hintText: '',
                      helperText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controllerNativePlace,
                    decoration: InputDecoration(
                      labelText: 'Native Place *',
                      hintText: '',
                      helperText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePersonalScreen()),
                      );
                    },
                    child: Text(
                      'Next',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w800,
                          fontSize: 21),
                    ),
                  ),
                ),
                SizedBox(height: 15,),

              ],
            ),
          ),



    );
  }
}