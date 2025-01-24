import 'package:flutter/material.dart';
import 'package:tash5esy_website/utils/colors.dart';

class HomeDiv extends StatelessWidget {
  const HomeDiv({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850,
      constraints: BoxConstraints(maxWidth: 1400),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  "Your Comprehensive Health Record Partner",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 46,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  "Tash5esy is a cutting-edge electronic health record (EHR) system designed to revolutionize healthcare management. With seamless integration for hospitals, doctors, and laboratory technicians, Tash5esy streamlines operations by offering a centralized platform for managing patient data, lab results, and X-rays.",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                ),
                Text(
                  "Our system empowers healthcare providers with real-time access to vital information, enhancing decision-making and improving patient care. Whether you are a small clinic or a large hospital, Tash5esy provides scalable solutions tailored to your needs.",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              "assets/images/about_us.png",
              scale: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
