import 'package:equatable/equatable.dart';

class PaymentRequest extends Equatable {
  final String token;
  const PaymentRequest({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
