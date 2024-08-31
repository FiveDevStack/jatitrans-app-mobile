import 'package:jatitrans_app/Repositories/GetUserRoute/Response/StepUserRouteResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetUserRouteResponse.g.dart';

@JsonSerializable()
class GetUserRouteResponse {
  String? routeName;
  String? totalTime;
  String? totalPrice;
  String? distance;
  String? status;
  List<StepUserRouteResponse>? stepRouteList;

  GetUserRouteResponse({
    this.routeName,
    this.totalTime,
    this.totalPrice,
    this.distance,
    this.status,
    this.stepRouteList,
  });

  factory GetUserRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserRouteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserRouteResponseToJson(this);
}
