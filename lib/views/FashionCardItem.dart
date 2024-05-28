import 'package:flutter/material.dart';

class FashionItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onAddToCart;

  FashionItemCard({required this.item, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                item['image'],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(item['brand']),
                Text('\$${item['price']}'),
                Text('Rating: ${item['rating']}'),
                ElevatedButton(
                  onPressed: onAddToCart,
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
