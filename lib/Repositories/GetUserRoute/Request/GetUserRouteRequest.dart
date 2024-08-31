import 'package:json_annotation/json_annotation.dart';

part 'GetUserRouteRequest.g.dart';

@JsonSerializable()
class GetUserRouteRequest {
  String? email;
  String? fullName;
  String? routeId;

  GetUserRouteRequest({
    this.email,
    this.fullName,
    this.routeId,
  });

  factory GetUserRouteRequest.fromJson(Map<String, dynamic> json) =>
      _$GetUserRouteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserRouteRequestToJson(this);
}
