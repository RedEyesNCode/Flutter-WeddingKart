import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wedding_kart/src/view/widgets/AutoScrollBiodataCarousel.dart';
import 'package:wedding_kart/src/view/widgets/AutoScrollImageCardCarousel.dart';
import 'package:wedding_kart/src/view/widgets/BioDataItem.dart';
import 'package:wedding_kart/src/view/widgets/FilterSheet.dart';
import 'package:wedding_kart/src/view/widgets/ImageCard.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreenUI(),
    );
  }

}

class DashboardScreenUI extends StatefulWidget {

  @override
  _DashboardScreenUI createState() => _DashboardScreenUI();
}

class _DashboardScreenUI extends State<DashboardScreenUI>{
  var instaSuffix = "media/?size=l";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wedding Kart",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
        backgroundColor: Colors.redAccent,

      ),
      body:

      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/src/images/ic_wedding_banner_one.jpg"), // Update with your image path
              fit: BoxFit.cover,
              opacity: 0.4,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tie your Knots with our stars",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),


                ],

              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  "Discover your forever love at Wedding Star \n Where Hearts Unite @ Matrimony",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 20,),

              Row(
                children: [
                  Flexible(
                    flex: 7, // Takes 70% of the space
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w600,
                          color : Colors.redAccent,

                        ),
                        decoration: InputDecoration(
                          hintText: "Search By Name...",
                          fillColor: Colors.white,

                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3, // Takes 30% of the space
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 8.0),
                      child: ActionChip(
                        label: Text("Filter",style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,

                        )),
                        onPressed: () {
                          // Implement your filter logic
                          showModalBottomSheet(context: context, builder: (BuildContext context){

                            return FilterSheet();

                          },shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),backgroundColor: Colors.white);
                        },
                        backgroundColor: Colors.white,
                        avatar: Icon(Icons.filter_list, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Featured Brides",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w700,
                          fontSize: 21),
                    ),
                  ],
                ),
              ),
              // BioDataItem(imageUrl: "https://www.instagram.com/p/CzlZe3kRfo1/"+instaSuffix, title: "_geetu_", subtitle: "Sample Description"),
              AutoScrollBiodataCarousel(
                bioDataItems: [
                  BioDataItem(
                    imageUrl: 'https://www.instagram.com/p/C5Xq4g6gTLe/'+instaSuffix,
                    title: '_geetu_',
                    subtitle: 'Geetika Thakur',
                  ),
                  BioDataItem(
                    imageUrl: 'https://www.instagram.com/p/C5i6ZhFJdka/'+instaSuffix,
                    title: 'Nitu Tiwari',
                    subtitle: 'Tiwari',
                  ),
                  BioDataItem(
                    imageUrl: 'https://www.instagram.com/p/Czv10RMsMZ3/'+instaSuffix,
                    title: 'Nitu Tiwari',
                    subtitle: 'Tiwari',
                  ),
                  BioDataItem(
                    imageUrl: 'https://www.instagram.com/p/C1O0Teytlgo/'+instaSuffix,
                    title: 'Nitu Tiwari',
                    subtitle: 'Tiwari',
                  ),
                  BioDataItem(
                    imageUrl: 'https://www.instagram.com/p/C5er3sKygjg/'+instaSuffix,
                    title: 'Nitu Tiwari',
                    subtitle: 'Tiwari',
                  ),
                  // Add more BioDataItem widgets as needed
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Featured Grooms",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w700,
                          fontSize: 21),
                    ),
                  ],
                ),
              ),
              AutoScrollBiodataCarousel(
                autoScrollDuration: const Duration(seconds: 5),
                bioDataItems: [
                  BioDataItem(
                    imageUrl: 'https://www.instagram.com/p/CZDv3ZDPqC1/'+instaSuffix,
                    title: '_ashu_',
                    subtitle: 'Ashutosh Singh',
                  ),
                  BioDataItem(
                    imageUrl: 'https://www.instagram.com/p/CgHzaBXvCmb/'+instaSuffix,
                    title: '_ashu_',
                    subtitle: 'Tech @ Megma Group',
                  ),
                  // Add more BioDataItem widgets as needed
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "We are Best in Finding Matches",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              AutoScrollImageCardCarousel(
                autoScrollDuration: const Duration(seconds: 2),
                imageCards: [
                  ImageCard(imageUrl: "https://www.instagram.com/p/CnwVtknKhar/"+instaSuffix, text: "Unmarried")
                  ,
                  ImageCard(
                    imageUrl: 'https://www.instagram.com/p/C4VfwCmJht5/'+instaSuffix, // Replace with your image URL
                    text: 'Awaiting Divorce',
                  ),
                  ImageCard(
                    imageUrl: 'https://www.instagram.com/p/C5bMRX7PuxQ/'+instaSuffix, // Replace with your image URL
                    text: 'Divorce',
                  ),
                  // Add more ImageCard widgets as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );


  }

}