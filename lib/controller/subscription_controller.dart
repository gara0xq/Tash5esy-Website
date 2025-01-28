import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tash5esy_website/controller/main_controller.dart';
import 'package:tash5esy_website/model/subscription_model.dart';

class SubscriptionController extends GetxController {
  final supabase = Supabase.instance.client;

  List<SubscriptionModel> subscriptions = [];

  ValueNotifier<bool> fetching = ValueNotifier<bool>(true);

  Lang currentLang = Lang.EN;

  PostgrestMap response = {};
  String? username;
  final homeKey = GlobalKey();
  final ourServiceKey = GlobalKey();
  final aboutUsKey = GlobalKey();
  final contactUsKey = GlobalKey();

  @override
  void onInit() async {
    currentLang = window.localStorage["Lang"] == "AR" ? Lang.AR : Lang.EN;
    await fetchSubscriptions();

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

  Future<List> fetchSubscriptions() async {
    try {
      final response = await supabase.from('subscriptions').select();
      for (var subscription in response) {
        subscriptions.add(SubscriptionModel.fromJson(subscription));
      }
      fetching.value = false;
      update();
      return subscriptions;
    } catch (e) {
      log("Error in fetching subscriptions : $e");
      return [];
    }
  }

  changeLang() {
    if (currentLang == Lang.EN) {
      window.localStorage["Lang"] = "AR";
      currentLang = Lang.AR;
    } else if (currentLang == Lang.AR) {
      window.localStorage["Lang"] = "EN";
      currentLang = Lang.EN;
    }
    update();
  }

  scrollController(GlobalKey key) {
    Get.back();
    Get.back();
    
  }

  logout() {
    window.localStorage.remove("currentUser");
    update();
    Get.back();
  }
}
