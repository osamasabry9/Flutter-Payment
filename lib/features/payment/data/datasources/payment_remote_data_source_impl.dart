import 'package:flutter/material.dart';
import 'package:payment_app/features/payment/data/datasources/payment_remote_data_source.dart';

import '../../../../core/network/dio.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../domain/usecases/get_payment_request_usecase.dart';
import '../models/auth_request_model.dart';
import '../models/order_registration_model.dart';
import '../models/payment_request_model.dart';

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  AuthRequestModel? authTokenModel;

  @override
  Future<void> getAuthToken() async {
    DioHelperPayment.postData(url: AppConstants.getAuthToken, data: {
      'api_key': AppConstants.paymentApiKey,
    }).then((value) {
      authTokenModel = AuthRequestModel.fromJson(value.data);
      AppConstants.paymentFirstToken = authTokenModel!.token;
      debugPrint('The token 🍅');
    }).catchError((error) {
      debugPrint('Error in auth token 🤦‍♂️');
    });
  }

  @override
  Future<void> getOrderRegistrationID(PaymentParameters parameters) async {
    DioHelperPayment.postData(url: AppConstants.getOrderId, data: {
      'auth_token': AppConstants.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": parameters.priceOrder,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      OrderRegistrationModel orderRegistrationModel =
          OrderRegistrationModel.fromJson(value.data);
      AppConstants.paymentOrderId = orderRegistrationModel.id.toString();
      debugPrint('The order id 🍅 =${AppConstants.paymentOrderId}');
      getPaymentRequest(parameters);
    }).catchError((error) {
      debugPrint('Error in order id 🤦‍♂️');
    });
  }

  @override
  Future<void> getPaymentRequest(PaymentParameters parameters) async {
    DioHelperPayment.postData(
      url: AppConstants.getPaymentRequest,
      data: {
        "auth_token": AppConstants.paymentFirstToken,
        "amount_cents": parameters.priceOrder,
        "expiration": 3600,
        "order_id": AppConstants.paymentOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": parameters.email,
          "floor": "NA",
          "first_name": parameters.firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": parameters.phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": parameters.lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": AppConstants.integrationIdCard,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      PaymentRequestModel paymentRequestModel =
          PaymentRequestModel.fromJson(value.data);
      AppConstants.finalToken = paymentRequestModel.token.toString();
      debugPrint('Final token 🚀 ${AppConstants.finalToken}');
    }).catchError((error) {
      debugPrint('Error in final token 🤦‍♂️');
    });
  }

  @override
  Future<void> getRefCode() async {
    DioHelperPayment.postData(
      url: AppConstants.getRefCode,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": AppConstants.finalToken,
      },
    ).then((value) {
      AppConstants.refCode = value.data['id'].toString();
      debugPrint('The ref code 🍅${AppConstants.refCode}');
    }).catchError((error) {
      debugPrint("Error in ref code 🤦‍♂️");
    });
  }
}
