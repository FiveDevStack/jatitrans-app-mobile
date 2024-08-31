import 'package:json_annotation/json_annotation.dart';

part 'GetBarcodeTicketDM.g.dart';

@JsonSerializable()
class GetBarcodeTicketDM {
  String? stationName;
  String? transportationName;
  String? price;
  String? imageBarcode;
  String? status;

  GetBarcodeTicketDM({
    this.stationName,
    this.transportationName,
    this.price,
    this.imageBarcode,
    this.status,
  });

  factory GetBarcodeTicketDM.fromJson(Map<String, dynamic> json) =>
      _$GetBarcodeTicketDMFromJson(json);

  Map<String, dynamic> toJson() => _$GetBarcodeTicketDMToJson(this);
}
