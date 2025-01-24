import 'package:get/get.dart';

class HomeController extends GetxController {
  Lang currentLang = Lang.EN;

  changeLang() {
    if (currentLang == Lang.EN)
      currentLang = Lang.AR;
    else if (currentLang == Lang.AR) currentLang = Lang.EN;
    update();
  }
}

enum Lang {
  AR,
  EN,
}
