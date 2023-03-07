import '../../domain/entities/payment_request.dart';

class PaymentRequestModel extends PaymentRequest {
  const PaymentRequestModel({
    required super.token,
  });

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) {
    return PaymentRequestModel(
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
