// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:shopeasy/config/constants.dart';
import 'package:shopeasy/views/customtext.dart';


class customButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback? action;
  //final VoidCallback? onTap;
  const customButton({
    super.key,
    this.action,
    required this.buttonLabel,
    //this.onTap,
  });

  //final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: customText(
        label: buttonLabel,
        labelColor: Colors.white
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        elevation: 10,
        padding: const EdgeInsets.all(20),
        //shadowColor: primaryColor
      ),
    );
  }
}
