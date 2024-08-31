// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetRouteRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRouteRequest _$GetRouteRequestFromJson(Map<String, dynamic> json) =>
    GetRouteRequest(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      fromLat: json['fromLat'] as String?,
      fromLong: json['fromLong'] as String?,
      toLat: json['toLat'] as String?,
      toLong: json['toLong'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$GetRouteRequestToJson(GetRouteRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'fromLat': instance.fromLat,
      'fromLong': instance.fromLong,
      'toLat': instance.toLat,
      'toLong': instance.toLong,
      'price': instance.price,
    };
