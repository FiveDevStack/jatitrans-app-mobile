import 'package:json_annotation/json_annotation.dart';

part 'PaymentBillResponse.g.dart';

@JsonSerializable()
class PaymentBillResponse {
  String? routeId;

  PaymentBillResponse({
    this.routeId,
  });

  factory PaymentBillResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentBillResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentBillResponseToJson(this);
}
