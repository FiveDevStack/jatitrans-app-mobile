import 'package:json_annotation/json_annotation.dart';

part 'StepUserRouteResponse.g.dart';

@JsonSerializable()
class StepUserRouteResponse {
  String? id;
  String? fromStationName;
  String? transportationId;
  String? transportationName;
  String? nextDestinationTime;
  String? nextDestinationDistance;
  String? toStationName;
  String? price;
  String? statusItem;

  StepUserRouteResponse({
    this.id,
    this.fromStationName,
    this.transportationId,
    this.transportationName,
    this.nextDestinationTime,
    this.nextDestinationDistance,
    this.toStationName,
    this.price,
    this.statusItem,
  });

  factory StepUserRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$StepUserRouteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StepUserRouteResponseToJson(this);
}
