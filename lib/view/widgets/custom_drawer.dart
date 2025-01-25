import 'package:flutter/material.dart';
import 'package:tash5esy_website/controller/home_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}
