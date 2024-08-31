import 'package:json_annotation/json_annotation.dart';

part 'GetConfirmationPaymentResponse.g.dart';

@JsonSerializable()
class GetConfirmationPaymentResponse {
  String? routeName;
  String? totalTime;
  String? totalPrice;
  String? distance;
  String? serviceFee;

  GetConfirmationPaymentResponse({
    this.routeName,
    this.totalTime,
    this.totalPrice,
    this.distance,
    this.serviceFee,
  });

  factory GetConfirmationPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConfirmationPaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetConfirmationPaymentResponseToJson(this);
}
