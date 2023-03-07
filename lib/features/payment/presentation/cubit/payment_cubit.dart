import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../domain/usecases/get_auth_token_usecase.dart';
import '../../domain/usecases/get_order_registration_id_usecase.dart';
import '../../domain/usecases/get_payment_request_usecase.dart';
import '../../domain/usecases/get_ref_code_usecase.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  final GetAuthTokenUseCases getAuthTokenUseCase;
  final GetOrderRegistrationIDUseCases getOrderRegistrationIDUseCase;
  final GetPaymentRequestUseCases getPaymentRequestUseCase;
  final GetRefCodeUseCases getRefCodeUseCase;

  PaymentCubit({
    required this.getAuthTokenUseCase,
    required this.getOrderRegistrationIDUseCase,
    required this.getPaymentRequestUseCase,
    required this.getRefCodeUseCase,
  }) : super(PaymentInitial());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingStates());
    getAuthTokenUseCase.call(const NoParameters()).then((value) {
      emit(PaymentAuthSuccessStates());
    }).catchError((error) {
      emit(
        PaymentAuthErrorStates(error.toString()),
      );
    });
  }

  Future getOrderRegistrationID({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(PaymentOrderIdLoadingStates());
    getOrderRegistrationIDUseCase
        .call(PaymentParameters(
      priceOrder: price,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    ))
        .then((value) {
      getPaymentRequest(price, firstName, lastName, email, phone);
      emit(PaymentOrderIdSuccessStates());
    }).catchError((error) {
      emit(
        PaymentOrderIdErrorStates(error.toString()),
      );
    });
  }

  // for final request token

  Future<void> getPaymentRequest(
    String priceOrder,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    emit(PaymentRequestTokenLoadingStates());
    getPaymentRequestUseCase
        .call(PaymentParameters(
            priceOrder: priceOrder,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone))
        .then((value) {
      emit(PaymentRequestTokenSuccessStates());
    }).catchError((error) {
      emit(
        PaymentRequestTokenErrorStates(error.toString()),
      );
    });
  }

  Future getRefCode() async {
     emit(PaymentRefCodeLoadingStates());
    getRefCodeUseCase.call(const NoParameters()).then((value) {
      emit(PaymentRefCodeSuccessStates());
    }).catchError((error) {
      emit(PaymentRefCodeErrorStates(error.toString()));
    });
  }
}
