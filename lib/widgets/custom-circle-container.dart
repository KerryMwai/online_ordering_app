import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:online_ordering_app/constants/constant.dart';

class CustomCircleContainer extends StatelessWidget {
  IconData icon;
CustomCircleContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: black)),
      child: Center(
          child: Icon(
        icon,
        size: 28,
        color: black.withOpacity(0.7),
      )),
    );
  }
}
