import 'package:flutter/material.dart';
import 'package:tash5esy_website/utils/colors.dart';

class OurServiceDiv extends StatelessWidget {
  const OurServiceDiv({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850,
      constraints: BoxConstraints(maxWidth: 1400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 80,
        children: [
          Text(
            "Our Services",
            style: TextStyle(
              color: primaryColor,
              fontSize: 46,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _serviceItem(
                  image: "assets/images/service1.png",
                  title: "Comprehensive Medical Records",
                ),
              ),
              Expanded(
                child: _serviceItem(
                  image: "assets/images/service2.png",
                  title: "Integrated Lab Results",
                ),
              ),
              Expanded(
                child: _serviceItem(
                  image: "assets/images/service3.png",
                  title: "Seamless Appointment Scheduling",
                ),
              ),
              Expanded(
                child: _serviceItem(
                  image: "assets/images/service4.png",
                  title: "Easy Payment Solutions",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _serviceItem({required String image, required String title}) {
  return Column(
    spacing: 20,
    children: [
      Image.asset(image),
      Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    ],
  );
}
