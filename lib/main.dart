import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tash5esy_website/my_translation.dart';
import 'package:tash5esy_website/view/screens/login_screen.dart';
import 'package:tash5esy_website/view/screens/main_screen.dart';
import 'package:tash5esy_website/view/screens/signup_screen.dart';
import 'package:tash5esy_website/view/screens/subscription_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await MyTranslation.loadTranslations();
  await Supabase.initialize(
    url: "https://ieystdzfdycyhcgpqdzn.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlleXN0ZHpmZHljeWhjZ3BxZHpuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc4OTAzNTIsImV4cCI6MjA1MzQ2NjM1Mn0.bIB-bJMPxd80LdY7zwXdUF1MhyBtVHKu7phF87aSIto",
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: Locale('en'),
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
