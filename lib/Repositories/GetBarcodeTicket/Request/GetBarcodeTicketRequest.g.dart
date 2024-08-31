// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetBarcodeTicketRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBarcodeTicketRequest _$GetBarcodeTicketRequestFromJson(
        Map<String, dynamic> json) =>
    GetBarcodeTicketRequest(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      routeId: json['routeId'] as String?,
      stepItemId: json['stepItemId'] as String?,
      statusItem: json['statusItem'] as String?,
    );

Map<String, dynamic> _$GetBarcodeTicketRequestToJson(
        GetBarcodeTicketRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'routeId': instance.routeId,
      'stepItemId': instance.stepItemId,
      'statusItem': instance.statusItem,
    };
