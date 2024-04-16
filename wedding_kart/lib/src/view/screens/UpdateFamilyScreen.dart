import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_kart/src/utils/DialogUtil.dart';
import 'package:wedding_kart/src/view/screens/DashboardScreen.dart';
import 'package:wedding_kart/src/view/widgets/SingleSelectableChipGroup.dart';

class UpdateFamilyScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return UpdateFamilyScreenUI();
  }

}

class UpdateFamilyScreenUI extends StatefulWidget {

  @override
  _UpdateFamilyScreenUI createState() => _UpdateFamilyScreenUI();

}

class _UpdateFamilyScreenUI extends State<UpdateFamilyScreenUI>{

  String _selectedFatherStatus = 'Employed';
  String _selectedMotherStatus = 'Employed';
  final TextEditingController _controllerNoOfBros = TextEditingController();
  final TextEditingController _controllerNoOfSis = TextEditingController();
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
              "Family Details",
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
                    "Father Status",
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
                    options: ['Employed', 'Retired','Business','Not Employed','Passed Away'],

                    onChanged: (selectedOption) {
                      setState(() {
                        _selectedFatherStatus = selectedOption;
                      });
                    },
                    selectedOption: _selectedFatherStatus,
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
                    "Mother Status ",
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
                    options: ['Employed', 'Retired','Business','Not Employed','Passed Away'],

                    onChanged: (selectedOption) {
                      setState(() {
                        _selectedMotherStatus = selectedOption;
                      });
                    },
                    selectedOption: _selectedMotherStatus,
                  ),
                ],
              ),
            ),

            SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerNoOfBros,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'No of brothers',
                  hintText: '',
                  helperText: '',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerNoOfSis,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'No of Sisters',
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
                  if(_controllerNoOfBros.text.isEmpty){
                    DialogUtil.showAlertDialog(context, 'Please enter no of brothers');
                  }else if(_controllerNoOfSis.text.isEmpty){
                    DialogUtil.showAlertDialog(context, 'Please enter no of sisters');
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
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