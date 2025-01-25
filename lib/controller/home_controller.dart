import 'package:get/get.dart';

class HomeController extends GetxController {
  Lang currentLang = Lang.EN;
  bool drawer = false;
  List<Map<String, String>> whyUs = [
    {
      "title": "Comprehensive Solutions",
      "description":
          "Manage all your medical operations in one place, from patient records to lab results and x-rays.",
      "image": "assets/icons/whyus1.png",
    },
    {
      "title": "Real-Time Connectivity",
      "description":
          "A dashboard for doctors and lab technicians keeps everyone connected, ensuring accurate and instant updates.",
      "image": "assets/icons/whyus2.png",
    },
    {
      "title": "Data Security",
      "description":
          "Your data is protected with advanced encryption, ensuring patient confidentiality and trust.",
      "image": "assets/icons/whyus3.png",
    },
    {
      "title": "User-Friendly Interface",
      "description":
          "Our platform is designed with simplicity in mind, making it easy to use for professionals and patients alike.",
      "image": "assets/icons/whyus4.png",
    },
    {
      "title": "Scalability",
      "description":
          "Tash5esy grows with you, offering packages tailored to different operation sizes, users, and data needs.",
      "image": "assets/icons/whyus5.png",
    },
    {
      "title": "Support & Training",
      "description":
          "We provide 24/7 support and training sessions to ensure you get the most out of Tash5esy.",
      "image": "assets/icons/whyus6.png",
    },
  ];

  changeLang() {
    if (currentLang == Lang.EN)
      currentLang = Lang.AR;
    else if (currentLang == Lang.AR) currentLang = Lang.EN;
    update();
  }

  drawerController() {
    drawer = !drawer;
    update();
  }
}

enum Lang {
  AR,
  EN,
}
