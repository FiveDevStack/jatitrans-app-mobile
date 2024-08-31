// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentBillRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentBillRequest _$PaymentBillRequestFromJson(Map<String, dynamic> json) =>
    PaymentBillRequest(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      routeId: json['routeId'] as String?,
      totalPrice: json['totalPrice'] as String?,
      serviceFee: json['serviceFee'] as String?,
      methodPaymentId: json['methodPaymentId'] as String?,
    );

Map<String, dynamic> _$PaymentBillRequestToJson(PaymentBillRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'routeId': instance.routeId,
      'totalPrice': instance.totalPrice,
      'serviceFee': instance.serviceFee,
      'methodPaymentId': instance.methodPaymentId,
    };
