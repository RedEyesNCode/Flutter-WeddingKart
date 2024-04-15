import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/src/view/widgets/SingleSelectableChipGroup.dart';


class UpdatePersonalScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: UpdatePersonalScreenUI(),
    );
  }


}

class UpdatePersonalScreenUI extends StatefulWidget{

  @override
  _UpdatePersonalScreenState createState() => _UpdatePersonalScreenState();


}

class _UpdatePersonalScreenState extends State<UpdatePersonalScreenUI>{

  @override
  Widget build(BuildContext context) {
    String _selectedOptionCreatedBy = 'Self';

    String _selectedGender = 'Male';

    final TextEditingController _controllerFirstName = TextEditingController();
    final TextEditingController _controllerLastName = TextEditingController();
    final TextEditingController _controllerDateofBirth = TextEditingController();
    final TextEditingController _controllerHeight = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Row(
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios),color: Colors.white,),
            Text(
              "Personal Details",
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
            SingleSelectableChipGroup(
              options: ['Self', 'Son', 'Daughter','Brother','Relative','Sister','Friend'],

              onChanged: (selectedOption) {
                setState(() {
                  _selectedOptionCreatedBy = selectedOption;
                });
              },
              selectedOption: _selectedOptionCreatedBy,
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Gender ",
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
                    options: ['Male', 'Female'],

                    onChanged: (selectedOption) {
                      setState(() {
                        _selectedGender = selectedOption;
                      });
                    },
                    selectedOption: _selectedOptionCreatedBy,
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
                    "Name *",
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controllerFirstName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        hintText: '',
                        helperText: '',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controllerLastName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: '',
                        helperText: '',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Date of Birth *",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Day',
                        hintText: '',
                        helperText: '',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Month',
                        hintText: '',
                        helperText: '',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Year',
                        hintText: '',
                        helperText: '',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Heigth *",
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controllerFirstName,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Feet',
                        hintText: '',
                        helperText: '',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Inches',
                        hintText: '',
                        helperText: '',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
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