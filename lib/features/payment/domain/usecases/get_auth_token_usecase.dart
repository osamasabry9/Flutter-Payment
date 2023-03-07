import '../../../../core/usecase/base_usecase.dart';
import '../repositories/base_payment_repository.dart';

class GetAuthTokenUseCases extends BaseUseCase<void, NoParameters> {
  GetAuthTokenUseCases({required this.basePaymentRepository});

  final BasePaymentRepository basePaymentRepository;

@override
  Future<void>  call(NoParameters parameters) async {
    return await basePaymentRepository.getAuthToken();
  }
}