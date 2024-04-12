import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String text;

  ImageCard({
    required this.imageUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,

      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 200, // Adjust the height of the image as needed
          ),
          Container(
            color: Colors.redAccent, // Color of the box
            height: 50, // Height of the box
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 18, // Text size
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold, // Text weight
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
