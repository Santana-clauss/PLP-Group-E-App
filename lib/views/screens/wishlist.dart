import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  final String? itemToAdd; // The item to add to the wishlist
  final List<String>?
      existingWishlistItems; // The existing items in the wishlist

  const WishlistScreen({Key? key, this.itemToAdd, this.existingWishlistItems})
      : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  static final Map<int, List<String>> _wishlistItems = {};

  @override
  void initState() {
    super.initState();
    final hashcode = widget.hashCode;
    _wishlistItems[hashcode] = widget.existingWishlistItems ?? [];
    if (widget.itemToAdd != null) {
      _wishlistItems[hashcode]?.add(widget.itemToAdd!);
    }
  }

  void addItem(String item) {
    setState(() {
      final hashcode = widget.hashCode;
      _wishlistItems[hashcode]?.add(item);
    });
  }

  void removeItem(int index) {
    setState(() {
      final hashcode = widget.hashCode;
      _wishlistItems[hashcode]?.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final hashcode = widget.hashCode;
    final items = _wishlistItems[hashcode] ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => removeItem(index),
            ),
          );
        },
      ),
    );
  }
}
