// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetBarcodeTicketDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBarcodeTicketDM _$GetBarcodeTicketDMFromJson(Map<String, dynamic> json) =>
    GetBarcodeTicketDM(
      stationName: json['stationName'] as String?,
      transportationName: json['transportationName'] as String?,
      price: json['price'] as String?,
      imageBarcode: json['imageBarcode'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GetBarcodeTicketDMToJson(GetBarcodeTicketDM instance) =>
    <String, dynamic>{
      'stationName': instance.stationName,
      'transportationName': instance.transportationName,
      'price': instance.price,
      'imageBarcode': instance.imageBarcode,
      'status': instance.status,
    };
