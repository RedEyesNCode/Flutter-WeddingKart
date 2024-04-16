import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/src/utils/DialogUtil.dart';
import 'package:wedding_kart/src/view/screens/UpdateFamilyScreen.dart';
import 'package:wedding_kart/src/view/widgets/SingleSelectableChipGroup.dart';


class UpdateCareerScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return UpdateCareerScreenUI();
  }

}

class UpdateCareerScreenUI extends StatefulWidget {

  @override
  _UpdateCareerScreenUI createState() => _UpdateCareerScreenUI();

}

class _UpdateCareerScreenUI extends State<UpdateCareerScreenUI>{

  String _selectedEducation = 'Bachelors';
  String _selectedCourse = 'Commerce';
  final TextEditingController _controllerJobTitle = TextEditingController();
  final TextEditingController _controllerWorkIn = TextEditingController();
  final TextEditingController _controllerCompanyName = TextEditingController();
  final TextEditingController _controllerAnnualIncome = TextEditingController();


  @override
  Widget build(BuildContext context) {

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
              "Career Details",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child:
                  Text(
                    "Highest Education",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleSelectableChipGroup(
                    options: ['Doctorate', 'Masters','Bachelors','Diploma','High School'],

                    onChanged: (selectedOption) {
                      setState(() {
                        _selectedEducation = selectedOption;
                      });
                    },
                    selectedOption: _selectedEducation,
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,

              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Course ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleSelectableChipGroup(
                    options: ['Engineering', 'Information Tech','Commerce','Arts','Defense'],

                    onChanged: (selectedOption) {
                      setState(() {
                        _selectedCourse = selectedOption;
                      });
                    },
                    selectedOption: _selectedCourse,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Work Experience!",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerJobTitle,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  hintText: '',
                  helperText: '',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerWorkIn,

                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Work In',
                  hintText: '',
                  helperText: '',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerCompanyName,

                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Company Name',
                  hintText: '',
                  helperText: '',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerAnnualIncome,

                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Annual Income',
                  hintText: '',
                  helperText: '',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
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

                  if(_controllerJobTitle.text.isEmpty){
                    DialogUtil.showAlertDialog(context, 'Please enter job title');
                  }else if(_controllerWorkIn.text.isEmpty){
                    DialogUtil.showAlertDialog(context, 'Please enter work in');
                  }else if(_controllerCompanyName.text.isEmpty){
                    DialogUtil.showAlertDialog(context, 'Please enter company name');

                  }else if(_controllerAnnualIncome.text.isEmpty){
                    DialogUtil.showAlertDialog(context, 'Please enter annual income');

                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateFamilyScreen()),
                    );
                  }


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