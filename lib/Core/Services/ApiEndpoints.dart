class ApiEndpoint {
  static ApiEndpoint? _instance;

  ApiEndpoint._internal() {
    _instance = this;
  }

  factory ApiEndpoint() => _instance ?? ApiEndpoint._internal();

  static const String login = "/login";
  static const String register = "/register";
  static const String getListTransportation = "/getListTransportation";
  static const String getRoute = "/getRoute";
  static const String getDetailRoute = "/getDetailRoute";
  static const String confirmPayment = "/confirmPayment";
  static const String getListPaymentMethod = "/listPaymentMethod";
  static const String paymentBill = "/payBill";
  static const String getUserRoute = "/getUserRoute";
  static const String getBarcodeTicket = "/getBarcodeTicket";
}
