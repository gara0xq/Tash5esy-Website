import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/view/screens/login_screen.dart';
import 'package:tash5esy_website/view/screens/main_screen.dart';
import 'package:tash5esy_website/view/screens/signup_screen.dart';
import 'package:tash5esy_website/view/screens/subscription_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => MainScreen()),
        GetPage(name: "/login", page: () => LoginScreen()),
        GetPage(name: "/signup", page: () => SignupScreen()),
        GetPage(name: "/subscription", page: () => SubscriptionScreen()),
      ],
    );
  }
}
