// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopeasy/config/constants.dart';
import 'package:shopeasy/views/customtext.dart';
import 'package:shopeasy/views/customtextfield.dart';

final TextEditingController userNameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white
                  .withOpacity(0.45), // Adjust opacity value as needed
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(label: "TWC",labelColor: whiteColor,fontSize: 32,),
                    customText(label: "You choose what you\n see,fit the attire and\n buy",labelColor: whiteColor,),
                    SizedBox(height: 80),
                    customTextField(
                      userFieldController: userNameController,
                      hint: "Username",
                      icon: Icons.person,
                      hideText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      userFieldController: passwordController,
                      hint: "Password",
                      icon: Icons.lock,
                      hideText: true,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: redColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 13, top: 13),
                        child: GestureDetector(
                          onTap: (){
                            gotohome();
                          },
                          child: customText(
                            label: "Login ",
                            labelColor: whiteColor,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        // Navigate to create account screen
                      },
                      child: customText(
                        label: "Don't have an account Create One",
                        labelColor: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void gotohome(){
   Navigator.pushNamed(context, "/home");
   
  }
}


