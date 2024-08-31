// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RouteDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteDataResponse _$RouteDataResponseFromJson(Map<String, dynamic> json) =>
    RouteDataResponse(
      id: json['id'] as String?,
      routeName: json['routeName'] as String?,
      time: json['time'] as String?,
      distance: json['distance'] as String?,
      totalPrice: json['totalPrice'] as String?,
    );

Map<String, dynamic> _$RouteDataResponseToJson(RouteDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'routeName': instance.routeName,
      'time': instance.time,
      'distance': instance.distance,
      'totalPrice': instance.totalPrice,
    };
