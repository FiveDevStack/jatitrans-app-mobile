import 'package:json_annotation/json_annotation.dart';

part 'GetConfirmationPaymentDM.g.dart';

@JsonSerializable()
class GetConfirmationPaymentDM {
  String? routeName;
  String? totalTime;
  String? totalPrice;
  String? distance;
  String? serviceFee;

  GetConfirmationPaymentDM({
    this.routeName,
    this.totalTime,
    this.totalPrice,
    this.distance,
    this.serviceFee,
  });

  factory GetConfirmationPaymentDM.fromJson(Map<String, dynamic> json) =>
      _$GetConfirmationPaymentDMFromJson(json);

  Map<String, dynamic> toJson() => _$GetConfirmationPaymentDMToJson(this);
}
