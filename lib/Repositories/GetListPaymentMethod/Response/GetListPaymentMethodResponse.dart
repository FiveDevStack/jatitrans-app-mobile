import 'package:jatitrans_app/Repositories/GetListPaymentMethod/Response/ListPaymentMethodResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetListPaymentMethodResponse.g.dart';

@JsonSerializable()
class GetListPaymentMethodResponse {
  List<ListPaymentMethodResponse>? listPaymentMethod;

  GetListPaymentMethodResponse({
    this.listPaymentMethod,
  });

  factory GetListPaymentMethodResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListPaymentMethodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetListPaymentMethodResponseToJson(this);
}
