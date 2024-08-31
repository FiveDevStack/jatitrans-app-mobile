// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetDetailRouteResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailRouteResponse _$GetDetailRouteResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailRouteResponse(
      routeName: json['routeName'] as String?,
      totalTime: json['totalTime'] as String?,
      totalPrice: json['totalPrice'] as String?,
      distance: json['distance'] as String?,
      stepRouteList: (json['stepRouteList'] as List<dynamic>?)
          ?.map((e) => StepRouteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDetailRouteResponseToJson(
        GetDetailRouteResponse instance) =>
    <String, dynamic>{
      'routeName': instance.routeName,
      'totalTime': instance.totalTime,
      'totalPrice': instance.totalPrice,
      'distance': instance.distance,
      'stepRouteList': instance.stepRouteList,
    };
