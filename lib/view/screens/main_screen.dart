import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/controller/home_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';
import 'package:tash5esy_website/view/screens/home_divs/home_div.dart';
import 'package:tash5esy_website/view/screens/home_divs/our_service_div.dart';
import 'package:tash5esy_website/view/widgets/custom_appbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffF7FCFD),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Stack(
            children: [
              SingleChildScrollView(
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
                            padding: EdgeInsets.symmetric(horizontal: 300),
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
                              child: Text(
                                "Empowering care through connectivity",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Our software suite seamlessly connects and digitizes the healthcare transportation ecosystem.",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
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
                    Container(
                      height: 850,
                      color: Color(0xffCF7D4E).withOpacity(0.05),
                    ),
                    Container(
                      height: 850,
                      constraints: BoxConstraints(maxWidth: 1400),
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      height: 400,
                      constraints: BoxConstraints(maxWidth: 1400),
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
              CustomAppBar(
                controller: controller,
              ),
            ],
          );
        },
      ),
    );
  }
}
