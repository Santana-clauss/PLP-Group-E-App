import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shopeasy/utils/routes.dart';
import 'package:shopeasy/views/cartprovider.dart';


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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopEasy',
      initialRoute: "/",
      getPages: Routes.routes,
      //home: DashboardPage(),
    );
  }
}
