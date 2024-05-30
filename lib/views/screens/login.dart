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
                image: AssetImage('/images/loginback.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white
                  .withOpacity(0.15), // Adjust opacity value as needed
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Image.asset(
                          "images/logo.png",
                          height: 300,
                          width: 300,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: customTextField(
                        userFieldController: userNameController,
                        hint: "Username",
                        icon: Icons.person,
                        hideText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: customTextField(
                        userFieldController: passwordController,
                        hint: "Password",
                        icon: Icons.lock,
                        hideText: true,
                      ),
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
                          onTap: () {
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

  void gotohome() {
    Navigator.pushNamed(context, "/home");
  }
}
