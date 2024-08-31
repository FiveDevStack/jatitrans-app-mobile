// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetRouteDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRouteDM _$GetRouteDMFromJson(Map<String, dynamic> json) => GetRouteDM(
      listRoute: (json['listRoute'] as List<dynamic>?)
          ?.map((e) => RouteDataDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRouteDMToJson(GetRouteDM instance) =>
    <String, dynamic>{
      'listRoute': instance.listRoute,
    };
