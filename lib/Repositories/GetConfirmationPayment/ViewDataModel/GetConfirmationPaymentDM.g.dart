// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetConfirmationPaymentDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConfirmationPaymentDM _$GetConfirmationPaymentDMFromJson(
        Map<String, dynamic> json) =>
    GetConfirmationPaymentDM(
      routeName: json['routeName'] as String?,
      totalTime: json['totalTime'] as String?,
      totalPrice: json['totalPrice'] as String?,
      distance: json['distance'] as String?,
      serviceFee: json['serviceFee'] as String?,
    );

Map<String, dynamic> _$GetConfirmationPaymentDMToJson(
        GetConfirmationPaymentDM instance) =>
    <String, dynamic>{
      'routeName': instance.routeName,
      'totalTime': instance.totalTime,
      'totalPrice': instance.totalPrice,
      'distance': instance.distance,
      'serviceFee': instance.serviceFee,
    };
