import 'package:json_annotation/json_annotation.dart';

part 'GetBarcodeTicketResponse.g.dart';

@JsonSerializable()
class GetBarcodeTicketResponse {
  String? stationName;
  String? transportationName;
  String? price;
  String? imageBarcode;
  String? status;

  GetBarcodeTicketResponse({
    this.stationName,
    this.transportationName,
    this.price,
    this.imageBarcode,
    this.status,
  });

  factory GetBarcodeTicketResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBarcodeTicketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBarcodeTicketResponseToJson(this);
}
