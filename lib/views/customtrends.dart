import 'package:flutter/material.dart';

class CustomTrends extends StatelessWidget {
  final String imageUrl;
  
  final String title;

  const CustomTrends({
    Key? key,
    required this.imageUrl,
    
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      
    );
  }
}
