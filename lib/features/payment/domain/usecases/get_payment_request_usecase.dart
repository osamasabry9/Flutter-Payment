import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../repositories/base_payment_repository.dart';

class GetPaymentRequestUseCases extends BaseUseCase<void, PaymentParameters> {
  final BasePaymentRepository basePaymentRepository;

  GetPaymentRequestUseCases({required this.basePaymentRepository});
  @override
  Future<void> call(PaymentParameters parameters) async {
    return await basePaymentRepository.getPaymentRequest(parameters);
  }
}

class PaymentParameters extends Equatable {
  final String priceOrder;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const PaymentParameters({
    required this.priceOrder,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        priceOrder,
        firstName,
        lastName,
        email,
        phone,
      ];
}
