// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetDetailRouteDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailRouteDM _$GetDetailRouteDMFromJson(Map<String, dynamic> json) =>
    GetDetailRouteDM(
      routeName: json['routeName'] as String?,
      totalTime: json['totalTime'] as String?,
      totalPrice: json['totalPrice'] as String?,
      distance: json['distance'] as String?,
      stepRouteList: (json['stepRouteList'] as List<dynamic>?)
          ?.map((e) => StepRouteDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDetailRouteDMToJson(GetDetailRouteDM instance) =>
    <String, dynamic>{
      'routeName': instance.routeName,
      'totalTime': instance.totalTime,
      'totalPrice': instance.totalPrice,
      'distance': instance.distance,
      'stepRouteList': instance.stepRouteList,
    };
