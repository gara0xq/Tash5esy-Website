class SubscriptionModel {
  SubscriptionsType planeType;
  bool isYearly;
  double price;
  String coupon;
  double discount;

  SubscriptionModel({
    required this.planeType,
    required this.isYearly,
    required this.price,
    required this.coupon,
    required this.discount,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        planeType: SubscriptionsType.values.firstWhere(
          (e) => e.name == json['PlanName'],
        ),
        isYearly: json["IsYearly"],
        price: json["Price"],
        coupon: json["Coupon"],
        discount: json["Discount"],
      );

  Map<String, dynamic> toJson() => {
        "PlanName": planeType,
        "IsYearly": isYearly,
        "Price": price,
        "Coupon": coupon,
        "Discount": discount,
      };
}

enum SubscriptionsType {
  Economic,
  Professional,
  Enterprise,
}
