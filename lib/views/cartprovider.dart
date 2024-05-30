import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  double get totalPrice => _cartItems.fold(
      0.0, (total, item) => total + item['price'] * item['quantity']);

  void addItem(Map<String, dynamic> item) {
    int index =
        _cartItems.indexWhere((cartItem) => cartItem['name'] == item['name']);
    if (index != -1) {
      _cartItems[index]['quantity'] += 1;
    } else {
      item['quantity'] = 1;
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    int index =
        _cartItems.indexWhere((cartItem) => cartItem['name'] == item['name']);
    if (index != -1) {
      _cartItems[index]['quantity'] -= 1;
      if (_cartItems[index]['quantity'] == 0) {
        _cartItems.removeAt(index);
      }
    }
    notifyListeners();
  }

  void removeItemCompletely(Map<String, dynamic> item) {
    _cartItems.removeWhere((cartItem) => cartItem['name'] == item['name']);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  List<Map<String, dynamic>> get trendingItems {
    return _cartItems.where((item) => item['quantity'] >= 4).toList()
      ..sort((a, b) => b['quantity'].compareTo(a['quantity']));
  }
}
