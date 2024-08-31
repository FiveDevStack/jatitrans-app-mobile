// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RouteDataDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteDataDM _$RouteDataDMFromJson(Map<String, dynamic> json) => RouteDataDM(
      id: json['id'] as String?,
      routeName: json['routeName'] as String?,
      time: json['time'] as String?,
      distance: json['distance'] as String?,
      totalPrice: json['totalPrice'] as String?,
    );

Map<String, dynamic> _$RouteDataDMToJson(RouteDataDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'routeName': instance.routeName,
      'time': instance.time,
      'distance': instance.distance,
      'totalPrice': instance.totalPrice,
    };
