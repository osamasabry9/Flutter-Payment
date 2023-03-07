
import '../../../../core/usecase/base_usecase.dart';
import '../repositories/base_payment_repository.dart';
import 'get_payment_request_usecase.dart';

class GetOrderRegistrationIDUseCases
    extends BaseUseCase<void, PaymentParameters> {
  GetOrderRegistrationIDUseCases({required this.basePaymentRepository});

  final BasePaymentRepository basePaymentRepository;

  @override
  Future<void> call(PaymentParameters parameters) async {
    return await basePaymentRepository.getOrderRegistrationID(parameters);
  }
}
