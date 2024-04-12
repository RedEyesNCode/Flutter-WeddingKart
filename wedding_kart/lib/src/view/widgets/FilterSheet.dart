import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int _selectedGenderIndex = 0; // 0 for Male, 1 for Female
  String? _selectedReligion;
  String? _selectedState;
  String? _selectedCaste;
  List<String> religions = ['Hindu', 'Muslim', 'Christian', 'Baniya','Punjabi Sikh','Brahmin','Kayastha'];
  List<String> states = ['Punjab', 'Rajasthan', 'Uttar Pradesh', 'Madhya Pradhesh'];
  List<String> castes = ['Sharma', 'Gupta', 'Oja', 'Singh'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: null, // Increased height to accommodate all fields
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Filter Options",
              style: TextStyle(fontSize: 18,fontFamily: 'PlayfairDisplay',color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ToggleButtons(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Male',style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent,

                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Female',style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent,

                      )),
                    ),
                  ],
                  isSelected: [_selectedGenderIndex == 0, _selectedGenderIndex == 1],
                  onPressed: (int index) {
                    setState(() {
                      _selectedGenderIndex = index;
                    });
                  },
                ),

              ],
            ),
            SizedBox(height: 20),

            TextField(
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,

              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Min Age"),
            ),
            SizedBox(height: 20),

            TextField(
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,

              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Max Age"),
            ),
            SizedBox(height: 20),

            DropdownButton<String>(
              isExpanded: true,
              value: _selectedReligion,
              hint: Text("Select Religion",style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,

              )),
              items: religions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w600,
                    color: Colors.redAccent,

                  )),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedReligion = newValue;
                });
              },
            ),
            SizedBox(height: 20),

            DropdownButton<String>(
              isExpanded: true,
              value: _selectedState,
              hint: Text("Select State",style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,

              )),
              items: states.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w600,
                    color: Colors.redAccent,

                  )),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedState = newValue;
                });
              },
            ),
            SizedBox(height: 20),

            DropdownButton<String>(
              isExpanded: true,
              value: _selectedCaste,
              hint: Text("Select Caste",style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,

              )),
              items: castes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w600,
                    color: Colors.redAccent,

                  )),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCaste = newValue;
                });
              },
            ),
            SizedBox(height: 20),

            Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children: [
              ElevatedButton(style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(left: 35,right: 35,top: 10,bottom: 10))// Set your desired color
              ),onPressed: () {
                print("Hii");

              }, child: Text(
                "Apply Filter",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w800,

                    fontSize: 21),
              ))

            ],),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
