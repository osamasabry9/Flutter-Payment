import 'package:get_it/get_it.dart';
import 'package:payment_app/features/payment/domain/usecases/get_auth_token_usecase.dart';
import 'package:payment_app/features/payment/domain/usecases/get_order_registration_id_usecase.dart';
import 'package:payment_app/features/payment/domain/usecases/get_payment_request_usecase.dart';
import 'package:payment_app/features/payment/domain/usecases/get_ref_code_usecase.dart';
import 'package:payment_app/features/payment/presentation/cubit/payment_cubit.dart';

import '../features/payment/data/datasources/payment_remote_data_source.dart';
import '../features/payment/data/datasources/payment_remote_data_source_impl.dart';
import '../features/payment/data/repositories/payment_repository.dart';
import '../features/payment/domain/repositories/base_payment_repository.dart';

final instance = GetIt.instance;

Future<void> init() async {
// ------------------------Cubits-----------------------------

  instance.registerFactory(() => PaymentCubit(
        getAuthTokenUseCase: instance.call(),
        getOrderRegistrationIDUseCase: instance.call(),
        getPaymentRequestUseCase: instance.call(),
        getRefCodeUseCase: instance.call(),
      ));

  // --------------------------Use Cases--------------------
  instance.registerLazySingleton(
      () => GetAuthTokenUseCases(basePaymentRepository: instance.call()));
        instance.registerLazySingleton(
      () => GetOrderRegistrationIDUseCases(basePaymentRepository: instance.call()));
        instance.registerLazySingleton(
      () => GetPaymentRequestUseCases(basePaymentRepository: instance.call()));
        instance.registerLazySingleton(
      () => GetRefCodeUseCases(basePaymentRepository: instance.call()));

    /// Repository
    instance.registerLazySingleton<BasePaymentRepository>(
        () => PaymentRepository(paymentRemoteDataSource: instance()));

    ///  Data Source
    instance.registerLazySingleton<PaymentRemoteDataSource>(
        () => PaymentRemoteDataSourceImpl());
}
