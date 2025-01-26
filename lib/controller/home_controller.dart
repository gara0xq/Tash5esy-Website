import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Lang currentLang = Lang.EN;
  
  final homeKey = GlobalKey();
  final ourServiceKey = GlobalKey();
  final aboutUsKey = GlobalKey();
  final contactUsKey = GlobalKey();

  changeLang() {
    if (currentLang == Lang.EN)
      currentLang = Lang.AR;
    else if (currentLang == Lang.AR) currentLang = Lang.EN;
    update();
  }


  scrollController(GlobalKey key) {
    BuildContext? context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

enum Lang {
  AR,
  EN,
}
