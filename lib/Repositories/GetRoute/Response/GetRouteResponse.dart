import 'package:jatitrans_app/Repositories/GetRoute/Response/RouteDataResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetRouteResponse.g.dart';

@JsonSerializable()
class GetRouteResponse {
  List<RouteDataResponse>? listRoute;

  GetRouteResponse({
    this.listRoute,
  });

  factory GetRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRouteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRouteResponseToJson(this);
}
