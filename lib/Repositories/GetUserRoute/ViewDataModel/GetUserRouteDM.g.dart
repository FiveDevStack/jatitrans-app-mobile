// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetUserRouteDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserRouteDM _$GetUserRouteDMFromJson(Map<String, dynamic> json) =>
    GetUserRouteDM(
      routeName: json['routeName'] as String?,
      totalTime: json['totalTime'] as String?,
      totalPrice: json['totalPrice'] as String?,
      distance: json['distance'] as String?,
      status: json['status'] as String?,
      stepRouteList: (json['stepRouteList'] as List<dynamic>?)
          ?.map((e) => StepUserRouteDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserRouteDMToJson(GetUserRouteDM instance) =>
    <String, dynamic>{
      'routeName': instance.routeName,
      'totalTime': instance.totalTime,
      'totalPrice': instance.totalPrice,
      'distance': instance.distance,
      'status': instance.status,
      'stepRouteList': instance.stepRouteList,
    };
