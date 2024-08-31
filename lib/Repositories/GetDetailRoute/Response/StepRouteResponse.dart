import 'package:json_annotation/json_annotation.dart';

part 'StepRouteResponse.g.dart';

@JsonSerializable()
class StepRouteResponse {
  String? id;
  String? fromStationName;
  String? transportationId;
  String? transportationName;
  String? nextDestinationTime;
  String? nextDestinationDistance;
  String? toStationName;
  String? price;

  StepRouteResponse({
    this.id,
    this.fromStationName,
    this.transportationId,
    this.transportationName,
    this.nextDestinationTime,
    this.nextDestinationDistance,
    this.toStationName,
    this.price,
  });

  factory StepRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$StepRouteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StepRouteResponseToJson(this);
}
