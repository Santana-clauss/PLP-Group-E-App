import 'package:flutter/material.dart';
import 'package:shopeasy/config/constants.dart';

class CustomDetails extends StatelessWidget {
  final String imageUrl;
  final String tileTitle;

  const CustomDetails({
    required this.imageUrl,
    required this.tileTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 150, // Adjust height here
            width: 150, // Adjust width here
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tileTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Icon(Icons.shopping_basket_rounded),
            ],
          ),
        ],
      ),
    );
  }
}
