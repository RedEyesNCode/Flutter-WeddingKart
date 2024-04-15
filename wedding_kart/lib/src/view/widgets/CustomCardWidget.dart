import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  // Constructor to accept parameters
  CustomCardWidget({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
        elevation: 5.0, // Optional: adds shadow under the card
        child: Column(
          mainAxisSize: MainAxisSize.min, // Fit content in the card
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.network(
                imageUrl, // Image URL from parameters
                width: double.infinity, // Makes the image expand to fit the card width
                height: 150, // Fixed height for the image
                fit: BoxFit.cover, // Cover the bounds of the box
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                title, // Title from parameters
                style: TextStyle(
                  fontSize: 24, // Big font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Text(
                description, // Description from parameters
                style: TextStyle(
                  fontSize: 16, // Smaller font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
