import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/home_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';
import 'package:tash5esy_website/view/screens/home_divs/home_div.dart';
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
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffF7FCFD),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  width: width,
                  child: Column(
                    spacing: 40,
                    children: [
                      SizedBox(height: 60),
                      Container(
                        height: 850,
                        constraints: BoxConstraints(maxWidth: 1400),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 30,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 8),
                              child: ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [primaryColor, foriegnColor],
                                ).createShader(
                                  Rect.fromLTWH(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                ),
                                child: AutoSizeText(
                                  "Empowering care through connectivity",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 70,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 20),
                              child: AutoSizeText(
                                "Our software suite seamlessly connects and digitizes the healthcare transportation ecosystem.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [primaryColor, foriegnColor],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      HomeDiv(),
                      OurServiceDiv(),
                      WhyUsDiv(),
                      SubscriptionDiv(),
                      Container(
                        height: 400,
                        constraints: BoxConstraints(maxWidth: 1400),
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
              ),
              CustomAppBar(
                controller: controller,
              ),
              if (width < 1150 && controller.drawer)
                InkWell(
                    onTap: () {
                      controller.drawerController();
                    },
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    child: SizedBox(
                      height: height,
                      width: width,
                    )),
              if (width < 1150)
                AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  right: controller.drawer ? 0 : -1000,
                  child: CustomDrawer(
                    controller: controller,
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
