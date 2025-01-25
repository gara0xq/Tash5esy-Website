import 'package:flutter/material.dart';
import 'package:tash5esy_website/utils/colors.dart';

class OurServiceDiv extends StatelessWidget {
  OurServiceDiv({super.key});
  final List<Map<String, String>> ourServices = [
    {
      "title": "Comprehensive Medical Records",
      "image": "assets/images/service1.png",
    },
    {
      "title": "Integrated Lab Results",
      "image": "assets/images/service2.png",
    },
    {
      "title": "Seamless Appointment Scheduling",
      "image": "assets/images/service3.png",
    },
    {
      "title": "Easy Payment Solutions",
      "image": "assets/images/service4.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 850,
      constraints: BoxConstraints(maxWidth: 1400),
      padding: EdgeInsets.symmetric(horizontal: 20),
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
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: ourServices.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (_, i) {
              return _serviceItem(
                  image: ourServices[i]["image"]!,
                  title: ourServices[i]["title"]!);
            },
          )
        ],
      ),
    );
  }
}

Widget _serviceItem({required String image, required String title}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Image.asset(image),
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ],
    ),
  );
}
