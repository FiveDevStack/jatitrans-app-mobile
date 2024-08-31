import 'package:json_annotation/json_annotation.dart';

part 'RouteDataDM.g.dart';

@JsonSerializable()
class RouteDataDM {
  String? id;
  String? routeName;
  String? time;
  String? distance;
  String? totalPrice;

  RouteDataDM({
    this.id,
    this.routeName,
    this.time,
    this.distance,
    this.totalPrice,
  });

  factory RouteDataDM.fromJson(Map<String, dynamic> json) =>
      _$RouteDataDMFromJson(json);

  Map<String, dynamic> toJson() => _$RouteDataDMToJson(this);
}
