import 'package:json_annotation/json_annotation.dart';

part 'GetDetailRouteRequest.g.dart';

@JsonSerializable()
class GetDetailRouteRequest {
  String? email;
  String? fullName;
  String? routeId;

  GetDetailRouteRequest({
    this.email,
    this.fullName,
    this.routeId,
  });

  factory GetDetailRouteRequest.fromJson(Map<String, dynamic> json) =>
      _$GetDetailRouteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailRouteRequestToJson(this);
}
