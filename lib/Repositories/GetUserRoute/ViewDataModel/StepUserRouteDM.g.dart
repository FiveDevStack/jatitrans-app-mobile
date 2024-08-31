// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StepUserRouteDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepUserRouteDM _$StepUserRouteDMFromJson(Map<String, dynamic> json) =>
    StepUserRouteDM(
      id: json['id'] as String?,
      fromStationName: json['fromStationName'] as String?,
      transportationId: json['transportationId'] as String?,
      transportationName: json['transportationName'] as String?,
      nextDestinationTime: json['nextDestinationTime'] as String?,
      nextDestinationDistance: json['nextDestinationDistance'] as String?,
      toStationName: json['toStationName'] as String?,
      price: json['price'] as String?,
      statusItem: json['statusItem'] as String?,
    );

Map<String, dynamic> _$StepUserRouteDMToJson(StepUserRouteDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromStationName': instance.fromStationName,
      'transportationId': instance.transportationId,
      'transportationName': instance.transportationName,
      'nextDestinationTime': instance.nextDestinationTime,
      'nextDestinationDistance': instance.nextDestinationDistance,
      'toStationName': instance.toStationName,
      'price': instance.price,
      'statusItem': instance.statusItem,
    };
