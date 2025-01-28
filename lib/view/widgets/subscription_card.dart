import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tash5esy_website/model/subscription_model.dart';
import 'package:tash5esy_website/utils/colors.dart';
import 'package:tash5esy_website/view/widgets/payment_box.dart';

class SubscriptionCard extends StatelessWidget {
  SubscriptionCard({super.key, required this.model});
  final List economic = [
    "economic_patient_record_management".tr,
    "economic_appointment_scheduling".tr,
    "economic_basic_analytics".tr,
    "economic_secure_storage".tr,
    "economic_advanced_marketing_tools".tr,
    "economic_multi_department_support".tr,
    "economic_operation_team_support".tr,
    "economic_custom_integrations".tr,
  ];
  final List profissional = [
    "professional_patient_record_management".tr,
    "professional_appointment_scheduling".tr,
    "professional_advanced_analytics".tr,
    "professional_secure_storage".tr,
    "professional_social_media_integration".tr,
    "professional_priority_technical_support".tr,
    "professional_operation_team_support".tr,
    "professional_unlimited_users".tr,
  ];
  final List enterprise = [
    "enterprise_full_patient_record_management".tr,
    "enterprise_appointment_scheduling".tr,
    "enterprise_comprehensive_analytics".tr,
    "enterprise_secure_storage".tr,
    "enterprise_advanced_marketing_tools".tr,
    "enterprise_custom_integrations".tr,
    "enterprise_operation_team_support".tr,
    "enterprise_unlimited_users".tr,
  ];
  final SubscriptionModel model;
  @override
  Widget build(BuildContext context) {
    Color mainColor = model.planeType == SubscriptionsType.Professional
        ? primaryColor
        : Colors.white;
    Color subColor = model.planeType == SubscriptionsType.Professional
        ? Colors.white
        : primaryColor;
    List currentTypeList = model.planeType == SubscriptionsType.Economic
        ? economic
        : model.planeType == SubscriptionsType.Professional
            ? profissional
            : enterprise;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        width: 350,
        height: model.planeType == SubscriptionsType.Professional ? 570 : 510,
        decoration: BoxDecoration(
          color: mainColor,
          border: Border.all(color: subColor, width: 2),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          spacing: model.planeType == SubscriptionsType.Professional ? 20 : 15,
          children: [
            Container(
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: subColor),
              ),
              child: AutoSizeText(
                "${model.planeType.name} Type",
                style: TextStyle(
                  color: subColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
            ),
            AutoSizeText(
              model.price.toString(),
              style: TextStyle(
                color: subColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
            AutoSizeText(
              "currency".tr,
              style: TextStyle(
                color: subColor,
                fontSize: 12,
                fontWeight: FontWeight.w100,
              ),
              maxLines: 1,
            ),
            _feature(currentTypeList[0], true, subColor),
            _feature(currentTypeList[1], true, subColor),
            _feature(currentTypeList[2], true, subColor),
            _feature(currentTypeList[3], true, subColor),
            _feature(
                currentTypeList[4],
                model.planeType == SubscriptionsType.Economic ? false : true,
                subColor),
            _feature(
                currentTypeList[5],
                model.planeType == SubscriptionsType.Economic ? false : true,
                subColor),
            _feature(
                currentTypeList[6],
                model.planeType == SubscriptionsType.Enterprise ? true : false,
                subColor),
            _feature(
                currentTypeList[7],
                model.planeType == SubscriptionsType.Enterprise ? true : false,
                subColor),
            InkWell(
              onTap: () {
                Get.dialog(PaymentBox(model: model));
              },
              child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: model.planeType == SubscriptionsType.Professional
                      ? Colors.white
                      : Color(0xffD3E7F0),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: AutoSizeText(
                  "choose_plan".tr,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _feature(String title, bool isHere, Color color) {
    return Row(
      spacing: 5,
      children: [
        isHere
            ? Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 15,
              )
            : Icon(
                Icons.radio_button_unchecked_outlined,
                color: Colors.grey,
                size: 15,
              ),
        Expanded(
          child: AutoSizeText(
            title,
            style: TextStyle(
              color: isHere ? color : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w100,
              decoration: isHere ? null : TextDecoration.lineThrough,
              decorationColor: Colors.grey,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
