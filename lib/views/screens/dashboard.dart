// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shopeasy/config/constants.dart';
import 'package:shopeasy/controllers/controllers.dart';
import 'package:shopeasy/views/categoryItemspage.dart';
import 'package:shopeasy/views/categorybutton.dart';
import 'package:shopeasy/views/customedetails.dart';
import 'package:shopeasy/views/customtext.dart';
import 'package:shopeasy/views/nav.dart';
import 'package:shopeasy/views/cartprovider.dart';
import 'package:shopeasy/views/screens/cartpage.dart';
import 'package:shopeasy/views/screens/feedback.dart';
import 'package:shopeasy/views/screens/profile.dart';
import 'package:shopeasy/views/screens/settings.dart';
import 'package:shopeasy/views/screens/wishlist.dart';

class DashboardPage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          switch (homeController.selectedPage.value) {
            case 0:
              return _buildHomePage(context);
            case 1:
              return CartPage();
            
            case 2:
              return WishlistScreen();
            case 3:
              return ProfilePage();
            case 4:
              return SettingsPage();
            
            default:
              return Container();
          }
        }),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final trendingItems = cart.trendingItems;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            color: greenColor,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      label: "Hello\n Santana",
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.feedback, color: blackColor),
                          onPressed: () {
                            Get.to(FeedbackPage());
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, color: blackColor),
                          onPressed: () {
                            Get.to(SettingsPage());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'search clothing items',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      suffixIcon: Icon(Icons.camera_alt, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      label: "Categories",
                      labelColor: blackColor,
                    ),
                    customText(label: "View All", labelColor: greyColor),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryButton(
                      label: 'Electronics',
                      onTap: () {
                        Get.to(CategoryItemsPage(category: 'Electronics'));
                      },
                    ),
                    CategoryButton(
                      label: 'Clothing',
                      onTap: () {
                        Get.to(CategoryItemsPage(category: 'Clothing'));
                      },
                    ),
                    CategoryButton(
                      label: 'Shoes',
                      onTap: () {
                        Get.to(CategoryItemsPage(category: 'Shoes'));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryButton(
                      label: 'Books',
                      onTap: () {
                        Get.to(CategoryItemsPage(category: 'Books'));
                      },
                    ),
                    CategoryButton(
                      label: 'Home & Kitchen',
                      onTap: () {
                        Get.to(CategoryItemsPage(category: 'Home & Kitchen'));
                      },
                    ),
                    CategoryButton(
                      label: 'Toys',
                      onTap: () {
                        Get.to(CategoryItemsPage(category: 'Toys'));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          label: "New Arrivals",
                          labelColor: blackColor,
                          fontSize: 24,
                        ),
                        customText(
                          label: "Discover the latest trends now",
                          labelColor: blackColor,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            customText(
                              label: "Explore",
                              labelColor: whiteColor,
                            ),
                            Icon(Icons.arrow_forward_rounded,
                                color: whiteColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(label: "Trending items"),
                    customText(label: "View All", labelColor: greyColor),
                  ],
                ),
                SizedBox(height: 20),
                if (trendingItems.isNotEmpty)
                  Column(
                    children: List.generate(
                      (trendingItems.length / 2).ceil(),
                      (index) {
                        final start = index * 2;
                        final end =
                            (index * 2 + 2).clamp(0, trendingItems.length);
                        final items = trendingItems.sublist(start, end);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Wrap(
                            spacing: 20.0,
                            runSpacing: 20.0,
                            children: items.map((item) {
                              return SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 30,
                                child: CustomDetails(
                                  imageUrl: item['image'],
                                  tileTitle: item['name'],
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
