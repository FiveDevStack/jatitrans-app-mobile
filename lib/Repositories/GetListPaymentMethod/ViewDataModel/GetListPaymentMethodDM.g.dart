// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetListPaymentMethodDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListPaymentMethodDM _$GetListPaymentMethodDMFromJson(
        Map<String, dynamic> json) =>
    GetListPaymentMethodDM(
      listPaymentMethod: (json['listPaymentMethod'] as List<dynamic>?)
          ?.map((e) => ListPaymentMethodDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListPaymentMethodDMToJson(
        GetListPaymentMethodDM instance) =>
    <String, dynamic>{
      'listPaymentMethod': instance.listPaymentMethod,
    };
