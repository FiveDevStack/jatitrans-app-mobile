import 'package:json_annotation/json_annotation.dart';

part 'ListPaymentMethodDM.g.dart';

@JsonSerializable()
class ListPaymentMethodDM {
  String? id;
  String? name;

  ListPaymentMethodDM({
    this.id,
    this.name,
  });

  factory ListPaymentMethodDM.fromJson(Map<String, dynamic> json) =>
      _$ListPaymentMethodDMFromJson(json);

  Map<String, dynamic> toJson() => _$ListPaymentMethodDMToJson(this);
}
