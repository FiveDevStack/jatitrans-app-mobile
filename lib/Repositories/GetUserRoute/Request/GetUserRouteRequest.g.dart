// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetUserRouteRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserRouteRequest _$GetUserRouteRequestFromJson(Map<String, dynamic> json) =>
    GetUserRouteRequest(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      routeId: json['routeId'] as String?,
    );

Map<String, dynamic> _$GetUserRouteRequestToJson(
        GetUserRouteRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'routeId': instance.routeId,
    };
