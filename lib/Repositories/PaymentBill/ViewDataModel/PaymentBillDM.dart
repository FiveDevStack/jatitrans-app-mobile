import 'package:json_annotation/json_annotation.dart';

part 'PaymentBillDM.g.dart';

@JsonSerializable()
class PaymentBillDM {
  String? routeId;

  PaymentBillDM({
    this.routeId,
  });

  factory PaymentBillDM.fromJson(Map<String, dynamic> json) =>
      _$PaymentBillDMFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentBillDMToJson(this);
}
