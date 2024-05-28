import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final Map<String, dynamic> itemDetails; // Single item detail

  CheckoutScreen({required this.itemDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item Details:', // Display item details
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Name: ${itemDetails['name']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Price: \$${itemDetails['price']}',
              style: TextStyle(fontSize: 16),
            ),
            // Add more item details if needed
            SizedBox(height: 20),
            // Location input field
            // Proceed to payment button
          ],
        ),
      ),
    );
  }
}
