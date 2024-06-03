// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopeasy/config/constants.dart';
import 'package:shopeasy/controllers/controllers.dart';
import 'package:shopeasy/views/screens/cart.dart';
import 'package:shopeasy/views/screens/dashboard.dart';
import 'package:shopeasy/views/screens/profile.dart';
import 'package:shopeasy/views/screens/wishlist.dart';

class BottomNavBar extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
   final List<Widget> screens = [
    DashboardPage(),
    CartPage(),
    WishlistScreen(),
    ProfilePage(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return GNav(
      color: const Color.fromARGB(255, 160, 150, 150),
      activeColor: Colors.green,
      tabBackgroundColor: Colors.green.withOpacity(0.1),
      backgroundColor: primaryColor.withOpacity(0.08),
      tabs: [
        GButton(
          icon: Icons.home,
          iconColor: blackColor,
          text: 'Home',
        ),
        
        GButton(
          icon: Icons.shopping_basket_rounded,
          iconColor: blackColor,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.shopping_basket_rounded,
          iconColor: blackColor,
          text: 'Wishlist',
        ),
        GButton(
          icon: Icons.person,
          iconColor: blackColor,
          text: 'Profile',
        ),
      ],
      selectedIndex: homeController.selectedPage.value,
      onTabChange: (index) {
        homeController.updateSelectedPage(index);
      },
    );
  }
}


