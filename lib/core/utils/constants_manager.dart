class AppConstants {
  // https://accept.paymob.com/api/auth/tokens
  static const String baseUrl = "https://accept.paymob.com/api";
  static const String getAuthToken = "/auth/tokens";
  static const String paymentApiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMlpwYkdWZmNHc2lPalk0TVRFek1Td2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuOHRxMURKdDkyVC1vR3NvcHZVdEg5RWUxaW1DWGU3V1IxRm5yTlBHczhGQjAtUk1oMUZlenVCZnBIeU1OemJPOU1KdkJDQnd3VnFwMEsxVFdzRUFLQUE=";
static const String getOrderId= "/ecommerce/orders";



  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/724619?payment_token=$finalToken';
  static  String paymentFirstToken= "";
  static  String paymentOrderId= "";
  static String finalToken = '';

  static const String integrationIdCard = '3327153';
  static const String integrationIdKiosk = '3327158';

  static String refCode = '';
}
