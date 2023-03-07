import '../usecases/get_payment_request_usecase.dart';

abstract class BasePaymentRepository {
  Future<void> getAuthToken();
  Future<void> getOrderRegistrationID(PaymentParameters parameters);
  Future<void> getPaymentRequest(PaymentParameters parameters);
  Future<void> getRefCode();
}
