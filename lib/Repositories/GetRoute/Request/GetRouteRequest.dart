import 'package:json_annotation/json_annotation.dart';

part 'GetRouteRequest.g.dart';

@JsonSerializable()
class GetRouteRequest {
  String? email;
  String? fullName;
  String? fromLat;
  String? fromLong;
  String? toLat;
  String? toLong;
  String? price;

  GetRouteRequest({
    this.email,
    this.fullName,
    this.fromLat,
    this.fromLong,
    this.toLat,
    this.toLong,
    this.price,
  });

  factory GetRouteRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRouteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRouteRequestToJson(this);
}
