import 'package:json_annotation/json_annotation.dart';

part 'GetConfirmationPaymentRequest.g.dart';

@JsonSerializable()
class GetConfirmationPaymentRequest {
  String? email;
  String? fullName;
  String? routeId;

  GetConfirmationPaymentRequest({
    this.email,
    this.fullName,
    this.routeId,
  });

  factory GetConfirmationPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$GetConfirmationPaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetConfirmationPaymentRequestToJson(this);
}
