// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetListPaymentMethodResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListPaymentMethodResponse _$GetListPaymentMethodResponseFromJson(
        Map<String, dynamic> json) =>
    GetListPaymentMethodResponse(
      listPaymentMethod: (json['listPaymentMethod'] as List<dynamic>?)
          ?.map((e) =>
              ListPaymentMethodResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListPaymentMethodResponseToJson(
        GetListPaymentMethodResponse instance) =>
    <String, dynamic>{
      'listPaymentMethod': instance.listPaymentMethod,
    };
