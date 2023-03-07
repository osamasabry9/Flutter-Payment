import 'package:payment_app/features/payment/domain/entities/order_registration.dart';

class OrderRegistrationModel extends OrderRegistration {
  const OrderRegistrationModel({
    required super.id,
  });
  factory OrderRegistrationModel.fromJson(Map<String, dynamic> json) {
    return OrderRegistrationModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
