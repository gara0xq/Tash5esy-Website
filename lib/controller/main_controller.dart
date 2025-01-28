import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:html';

class MainController extends GetxController {
  Lang currentLang = Lang.EN;
  String? username;
  final homeKey = GlobalKey();
  final ourServiceKey = GlobalKey();
  final aboutUsKey = GlobalKey();
  final contactUsKey = GlobalKey();
  PostgrestMap response = {};
  @override
  void onInit() async {
    currentLang = window.localStorage["Lang"] == "AR" ? Lang.AR : Lang.EN;
    bool user =
        await fetchCurrentUser(window.localStorage["currentUser"] ?? "");
    if (user) username = "${response["first_name"]} ${response["last_name"]}";
    update();

    super.onInit();
  }

  Future<bool> fetchCurrentUser(String id) async {
    try {
      response = await Supabase.instance.client
          .from('users')
          .select()
          .eq('id', id)
          .single();
      return true;
    } catch (e) {
      log(response['message'].toString());
      return false;
    }
  }

  changeLang() {
    if (currentLang == Lang.EN) {
      window.localStorage["Lang"] = "AR";
      Get.updateLocale(Locale('ar'));
      currentLang = Lang.AR;
    } else if (currentLang == Lang.AR) {
      window.localStorage["Lang"] = "EN";
      Get.updateLocale(Locale('en'));
      currentLang = Lang.EN;
    }

    update();
  }

  scrollController(GlobalKey? key) {
    if (key != null) {
      BuildContext? context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    } else {
      Get.toNamed("/subscription");
    }
  }

  logout() {
    window.localStorage.remove("currentUser");
    Get.back();
    update();
  }
}

enum Lang {
  AR,
  EN,
}
