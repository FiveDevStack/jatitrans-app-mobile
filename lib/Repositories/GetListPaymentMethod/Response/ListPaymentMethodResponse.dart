import 'package:json_annotation/json_annotation.dart';

part 'ListPaymentMethodResponse.g.dart';

@JsonSerializable()
class ListPaymentMethodResponse {
  String? id;
  String? name;

  ListPaymentMethodResponse({
    this.id,
    this.name,
  });

  factory ListPaymentMethodResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPaymentMethodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListPaymentMethodResponseToJson(this);
}
