import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeasy/views/FashionCardItem.dart';
import 'package:shopeasy/views/cartprovider.dart';

class CategoryItemsPage extends StatelessWidget {
  final String category;

  CategoryItemsPage({required this.category});

  final Map<String, List<Map<String, dynamic>>> itemsByCategory = {
    'Electronics': [
      {
        'image': '/images/Airpods.jpg',
        'brand': 'Amazon',
        'name': 'Airpods Pro',
        'price': 150.0,
        'oldPrice': 200.0,
        'rating': 5.0,
      },
      {
        'image': '/images/Watch.jpg',
        'brand': 'Amazon',
        'name': 'Electric Watch',
        'price': 450.0,
        'oldPrice': 500.0,
        'rating': 4.5
      },
      {
        'image': '/images/laptopStand.jpg',
        'brand': 'Amazon',
        'name': 'Laptop Stand',
        'price': 100.0,
        'oldPrice': 150.0,
        'rating': 5.0,
      },
      {
        'image': '/images/headphones.jpg',
        'brand': 'Oraimo',
        'name': 'HeadPhones ',
        'price': 300.0,
        'oldPrice': 250.0,
        'rating': 5.0,
      },
    ],
    'Clothing': [
      {
        'image': '/images/polo.jpg',
        'brand': 'Brand B',
        'name': 'Shirt 1',
        'price': 49.0,
        'oldPrice': 69.0,
        'rating': 4.0
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final items = itemsByCategory[category] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Items'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return FashionItemCard(
            item: item,
            onAddToCart: () {
              Provider.of<CartProvider>(context, listen: false).addItem(item);
              // Show a snackbar to indicate successful addition to cart
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item added to cart successfully'),
                  duration: Duration(seconds: 2), // Adjust duration as needed
                ),
              );
            },
          );
        },
      ),
    );
  }
}
