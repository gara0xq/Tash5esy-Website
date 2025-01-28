import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/main_controller.dart';
import 'package:tash5esy_website/view/screens/home_divs/contact_us_div.dart';
import 'package:tash5esy_website/view/screens/home_divs/home_div.dart';
import 'package:tash5esy_website/view/screens/home_divs/intro_div.dart';
import 'package:tash5esy_website/view/screens/home_divs/our_service_div.dart';
import 'package:tash5esy_website/view/screens/home_divs/subscription_div.dart';
import 'package:tash5esy_website/view/screens/home_divs/why_us_div.dart';
import 'package:tash5esy_website/view/widgets/custom_appbar.dart';
import 'package:tash5esy_website/view/widgets/custom_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Color(0xffF7FCFD),
            appBar: AppBar(
              backgroundColor: Color(0xffF7FCFD),
              centerTitle: true,
              surfaceTintColor: Colors.transparent,
              title: CustomAppBar(controller: controller),
            ),
            drawer: width < 1150
                ? CustomDrawer(
                    controller: controller,
                  )
                : null,
            body: SingleChildScrollView(
              child: SizedBox(
                width: width,
                child: Column(
                  spacing: 50,
                  children: [
                    IntroDiv(controller: controller),
                    HomeDiv(
                      key: controller.homeKey,
                    ),
                    OurServiceDiv(
                      key: controller.ourServiceKey,
                    ),
                    WhyUsDiv(
                      key: controller.aboutUsKey,
                    ),
                    SubscriptionDiv(),
                    ContactUsDiv(
                      key: controller.contactUsKey,
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
