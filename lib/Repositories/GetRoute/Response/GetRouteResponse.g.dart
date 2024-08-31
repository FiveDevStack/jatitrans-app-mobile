// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetRouteResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRouteResponse _$GetRouteResponseFromJson(Map<String, dynamic> json) =>
    GetRouteResponse(
      listRoute: (json['listRoute'] as List<dynamic>?)
          ?.map((e) => RouteDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRouteResponseToJson(GetRouteResponse instance) =>
    <String, dynamic>{
      'listRoute': instance.listRoute,
    };
