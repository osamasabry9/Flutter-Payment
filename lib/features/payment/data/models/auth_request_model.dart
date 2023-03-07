import 'package:payment_app/features/payment/domain/entities/auth_request.dart';

class AuthRequestModel extends AuthRequest {
  const AuthRequestModel({
    required super.token,
  });
  factory AuthRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthRequestModel(
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
