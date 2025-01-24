import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/view/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
