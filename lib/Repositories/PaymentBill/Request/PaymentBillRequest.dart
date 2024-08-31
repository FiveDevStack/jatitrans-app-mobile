import 'package:json_annotation/json_annotation.dart';

part 'PaymentBillRequest.g.dart';

@JsonSerializable()
class PaymentBillRequest {
  String? email;
  String? fullName;
  String? routeId;
  String? totalPrice;
  String? serviceFee;
  String? methodPaymentId;

  PaymentBillRequest({
    this.email,
    this.fullName,
    this.routeId,
    this.totalPrice,
    this.serviceFee,
    this.methodPaymentId,
  });
  factory PaymentBillRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentBillRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentBillRequestToJson(this);
}
