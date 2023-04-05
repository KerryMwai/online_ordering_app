import 'package:flutter/material.dart';
import 'package:online_ordering_app/constants/constant.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  CustomButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      width: (size.width - 20)*0.6,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(size.width * 0.2)),
      child:  Center(
        child: Text(
          buttonText,
          style:const TextStyle(
              fontSize: 18,
              color: white,
              fontWeight: FontWeight.w800,
              letterSpacing: 2.0),
        ),
      ),
    );
  }
}
