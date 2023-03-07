import 'package:payment_app/features/payment/domain/usecases/get_payment_request_usecase.dart';

import '../../domain/repositories/base_payment_repository.dart';
import '../datasources/payment_remote_data_source.dart';

class PaymentRepository extends BasePaymentRepository {
  final PaymentRemoteDataSource paymentRemoteDataSource;

  PaymentRepository({required this.paymentRemoteDataSource});

  @override
  Future<void> getAuthToken() async => paymentRemoteDataSource.getAuthToken();

  @override
  Future<void> getOrderRegistrationID(PaymentParameters parameters) async =>
      paymentRemoteDataSource.getOrderRegistrationID(parameters);

  @override
  Future<void> getPaymentRequest(PaymentParameters parameters) async =>
      paymentRemoteDataSource.getPaymentRequest(parameters);

  @override
  Future<void> getRefCode() async => paymentRemoteDataSource.getRefCode();
}
