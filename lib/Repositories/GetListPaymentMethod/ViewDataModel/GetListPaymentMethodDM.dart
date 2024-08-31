import 'package:jatitrans_app/Repositories/GetListPaymentMethod/ViewDataModel/ListPaymentMethodDM.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetListPaymentMethodDM.g.dart';

@JsonSerializable()
class GetListPaymentMethodDM {
  List<ListPaymentMethodDM>? listPaymentMethod;

  GetListPaymentMethodDM({
    this.listPaymentMethod,
  });

  factory GetListPaymentMethodDM.fromJson(Map<String, dynamic> json) =>
      _$GetListPaymentMethodDMFromJson(json);

  Map<String, dynamic> toJson() => _$GetListPaymentMethodDMToJson(this);
}
