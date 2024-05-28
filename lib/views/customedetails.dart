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
        color: greenColor,// Background color of the container
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10), // Padding for the content
      child: Column(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
              
            ),
           // child: Image.asset(imageUrl),
          ),
          //SizedBox(width: 10),
          // Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tileTitle,
                style: TextStyle(fontWeight: FontWeight.bold,),
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
