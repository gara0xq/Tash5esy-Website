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
    url: dotenv.env['DATABASE_URL']!,
    anonKey: dotenv.env['DATABASE_KEY']!,
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
