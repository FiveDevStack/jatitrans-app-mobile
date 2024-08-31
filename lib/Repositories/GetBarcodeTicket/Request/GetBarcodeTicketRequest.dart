import 'package:json_annotation/json_annotation.dart';

part 'GetBarcodeTicketRequest.g.dart';

@JsonSerializable()
class GetBarcodeTicketRequest {
  String? email;
  String? fullName;
  String? routeId;
  String? stepItemId;
  String? statusItem;

  GetBarcodeTicketRequest({
    this.email,
    this.fullName,
    this.routeId,
    this.stepItemId,
    this.statusItem,
  });

  factory GetBarcodeTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$GetBarcodeTicketRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetBarcodeTicketRequestToJson(this);
}
