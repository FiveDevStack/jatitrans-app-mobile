// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetDetailRouteRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailRouteRequest _$GetDetailRouteRequestFromJson(
        Map<String, dynamic> json) =>
    GetDetailRouteRequest(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      routeId: json['routeId'] as String?,
    );

Map<String, dynamic> _$GetDetailRouteRequestToJson(
        GetDetailRouteRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'routeId': instance.routeId,
    };
