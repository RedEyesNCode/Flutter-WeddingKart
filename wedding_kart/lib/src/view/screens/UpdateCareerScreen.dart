import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/src/view/widgets/SingleSelectableChipGroup.dart';


class UpdateCareerScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return UpdateCareerScreenUI();
  }

}

class UpdateCareerScreenUI extends StatefulWidget{

  @override
  _UpdateCareerScreenUI createState() => _UpdateCareerScreenUI();

}

class _UpdateCareerScreenUI extends State<UpdateCareerScreenUI>{

  String _selectedEducation = 'Bachelors';
  String _selectedCourse = 'Commerce';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
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
                  child: Text(
                    "Created By!",
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
              child: Row(
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
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Job Title',
                hintText: '',
                helperText: '',
                border: OutlineInputBorder(),
              ),
            ),


          ],
        ),
      ),
    );
  }


}