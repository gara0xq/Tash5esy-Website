import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tash5esy_website/controller/home_controller.dart';
import 'package:tash5esy_website/utils/colors.dart';

class IntroDiv extends StatelessWidget {
  IntroDiv({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height - 70,
      constraints: BoxConstraints(maxWidth: 1400, minHeight: 400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width / 8),
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
            padding: EdgeInsets.symmetric(horizontal: width / 20),
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
            onTap: () {
              controller.scrollController(controller.homeKey);
            },
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
    );
  }
}
