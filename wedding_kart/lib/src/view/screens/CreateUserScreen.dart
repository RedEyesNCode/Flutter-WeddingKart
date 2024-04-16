import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/src/utils/DialogUtil.dart';
import 'package:wedding_kart/src/view/screens/UpdateSocialScreen.dart';


class CreateUserScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return CreateUserScreenUI();

  }
}
class CreateUserScreenUI extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CreateUserScreenUI();
  }

}
class _CreateUserScreenUI extends State<CreateUserScreenUI>{
  final TextEditingController _controllerMobileNumber = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();


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
              "Create New Account !",
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [  Color.fromRGBO(109, 36, 81, 1),
                Color.fromRGBO(146, 29, 38, 1)],
              // Adjust gradient colors as needed
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Enter your Mobile Number",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _controllerMobileNumber,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            hintText: '',
                            helperText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Enter your Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _controllerPassword,

                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: '',
                            helperText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Enter your email to login in",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _controllerEmail,

                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            hintText: '',
                            helperText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromRGBO(109, 36, 81, 1),
                                Color.fromRGBO(146, 29, 38, 1)
                              ],
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if(_controllerMobileNumber.text.isEmpty){
                               DialogUtil.showAlertDialog(context, 'Please enter mobile number');
                              }else if(_controllerPassword.text.isEmpty){
                                DialogUtil.showAlertDialog(context, 'Please enter password');

                              }else if(_controllerEmail.text.isEmpty){
                                DialogUtil.showAlertDialog(context, 'Please enter email');

                              }else{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UpdateSocialScreen()),
                                );
                              }

                            },
                            child: Text(
                              'Register User',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.w800,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
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




    );


  }


}