import 'package:jatitrans_app/Repositories/GetDetailRoute/Response/StepRouteResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetDetailRouteResponse.g.dart';

@JsonSerializable()
class GetDetailRouteResponse {
  String? routeName;
  String? totalTime;
  String? totalPrice;
  String? distance;
  List<StepRouteResponse>? stepRouteList;

  GetDetailRouteResponse({
    this.routeName,
    this.totalTime,
    this.totalPrice,
    this.distance,
    this.stepRouteList,
  });

  factory GetDetailRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDetailRouteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailRouteResponseToJson(this);
}
