import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopeasy/views/cartprovider.dart';
import 'package:shopeasy/views/screens/checkout.dart'; 

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cart.cartItems[index];
                  final quantity =
                      item['quantity'] ?? 1; // Default quantity to 1 if null
        
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${item['price']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      cart.removeItem(item);
                                    },
                                  ),
                                  Text(
                                    '$quantity',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      cart.addItem(item);
                                    },
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.delete,color: Colors.red,),
                                    onPressed: () {
                                      cart.removeItemCompletely(item);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${cart.totalPrice}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (cart.cartItems.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CheckoutScreen(cartItems: cart.cartItems),
                          ),
                        );
                      }
                    },
                    child: Text('Checkout'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Change button color to green
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
