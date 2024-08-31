// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetConfirmationPaymentRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConfirmationPaymentRequest _$GetConfirmationPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    GetConfirmationPaymentRequest(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      routeId: json['routeId'] as String?,
    );

Map<String, dynamic> _$GetConfirmationPaymentRequestToJson(
        GetConfirmationPaymentRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'routeId': instance.routeId,
    };
