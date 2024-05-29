// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopeasy/config/constants.dart';
import 'package:shopeasy/views/categoryItemspage.dart';
import 'package:shopeasy/views/categorybutton.dart';
import 'package:shopeasy/views/customedetails.dart';
import 'package:shopeasy/views/customtext.dart';
import 'package:shopeasy/views/nav.dart';

import 'package:provider/provider.dart';

import 'package:shopeasy/views/screens/cartpage.dart'; 
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First Container
            Container(
              height: 200,
              color: orangeColor,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(label: "Hello\n Santana"),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.search_rounded, color: blackColor),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_basket_rounded,
                                color: blackColor),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()),
                              );
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
            // Second Container
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItemsPage(
                                category: 'Electronics',
                              ),
                            ),
                          );
                        },
                      ),
                      CategoryButton(
                        label: 'Clothing',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItemsPage(
                                category: 'Clothing',
                              ),
                            ),
                          );
                        },
                      ),
                      CategoryButton(
                        label: 'Shoes',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItemsPage(
                                category: 'Shoes',
                              ),
                            ),
                          );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItemsPage(
                                category: 'Books',
                              ),
                            ),
                          );
                        },
                      ),
                      CategoryButton(
                        label: 'Home & Kitchen',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItemsPage(
                                category: 'Home & Kitchen',
                              ),
                            ),
                          );
                        },
                      ),
                      CategoryButton(
                        label: 'Toys',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItemsPage(
                                category: 'Toys',
                              ),
                            ),
                          );
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
                  SizedBox(
                    height: 20,
                  ),
                  // Row of customdetails widgets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomDetails(
                          imageUrl: "/images/polo.jpg",
                          tileTitle: "Sweatshirt",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomDetails(
                          imageUrl: "/images/Airpods.jpg",
                          tileTitle: "Airpods pro",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
