import 'package:json_annotation/json_annotation.dart';

part 'StepUserRouteDM.g.dart';

@JsonSerializable()
class StepUserRouteDM {
  String? id;
  String? fromStationName;
  String? transportationId;
  String? transportationName;
  String? nextDestinationTime;
  String? nextDestinationDistance;
  String? toStationName;
  String? price;
  String? statusItem;

  StepUserRouteDM({
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

  factory StepUserRouteDM.fromJson(Map<String, dynamic> json) =>
      _$StepUserRouteDMFromJson(json);

  Map<String, dynamic> toJson() => _$StepUserRouteDMToJson(this);
}
