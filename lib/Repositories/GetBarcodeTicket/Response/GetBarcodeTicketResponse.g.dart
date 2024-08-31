// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetBarcodeTicketResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBarcodeTicketResponse _$GetBarcodeTicketResponseFromJson(
        Map<String, dynamic> json) =>
    GetBarcodeTicketResponse(
      stationName: json['stationName'] as String?,
      transportationName: json['transportationName'] as String?,
      price: json['price'] as String?,
      imageBarcode: json['imageBarcode'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GetBarcodeTicketResponseToJson(
        GetBarcodeTicketResponse instance) =>
    <String, dynamic>{
      'stationName': instance.stationName,
      'transportationName': instance.transportationName,
      'price': instance.price,
      'imageBarcode': instance.imageBarcode,
      'status': instance.status,
    };
