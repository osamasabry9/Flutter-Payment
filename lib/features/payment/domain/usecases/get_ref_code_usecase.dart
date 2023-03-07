import '../../../../core/usecase/base_usecase.dart';
import '../repositories/base_payment_repository.dart';

class GetRefCodeUseCases extends BaseUseCase<void, NoParameters> {
  final BasePaymentRepository basePaymentRepository;

  GetRefCodeUseCases({required this.basePaymentRepository});
@override
  Future<void>  call(NoParameters parameters) async {
    return await basePaymentRepository.getRefCode();
  }
}