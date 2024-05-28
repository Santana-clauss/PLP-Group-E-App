import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeasy/views/cartprovider.dart';
import 'package:shopeasy/views/screens/dashboard.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopEasy',
      home: DashboardPage(),
    );
  }
}
