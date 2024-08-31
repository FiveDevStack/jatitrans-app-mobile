import 'package:json_annotation/json_annotation.dart';

part 'RouteDataResponse.g.dart';

@JsonSerializable()
class RouteDataResponse {
  String? id;
  String? routeName;
  String? time;
  String? distance;
  String? totalPrice;

  RouteDataResponse({
    this.id,
    this.routeName,
    this.time,
    this.distance,
    this.totalPrice,
  });

  factory RouteDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RouteDataResponseToJson(this);
}
