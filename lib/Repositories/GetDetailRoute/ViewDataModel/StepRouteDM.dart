import 'package:json_annotation/json_annotation.dart';

part 'StepRouteDM.g.dart';

@JsonSerializable()
class StepRouteDM {
  String? id;
  String? fromStationName;
  String? transportationId;
  String? transportationName;
  String? nextDestinationTime;
  String? nextDestinationDistance;
  String? toStationName;
  String? price;

  StepRouteDM({
    this.id,
    this.fromStationName,
    this.transportationId,
    this.transportationName,
    this.nextDestinationTime,
    this.nextDestinationDistance,
    this.toStationName,
    this.price,
  });

  factory StepRouteDM.fromJson(Map<String, dynamic> json) =>
      _$StepRouteDMFromJson(json);

  Map<String, dynamic> toJson() => _$StepRouteDMToJson(this);
}
