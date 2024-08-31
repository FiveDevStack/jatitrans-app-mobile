import 'package:jatitrans_app/Repositories/GetUserRoute/ViewDataModel/StepUserRouteDM.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetUserRouteDM.g.dart';

@JsonSerializable()
class GetUserRouteDM {
  String? routeName;
  String? totalTime;
  String? totalPrice;
  String? distance;
  String? status;
  List<StepUserRouteDM>? stepRouteList;

  GetUserRouteDM({
    this.routeName,
    this.totalTime,
    this.totalPrice,
    this.distance,
    this.status,
    this.stepRouteList,
  });

  factory GetUserRouteDM.fromJson(Map<String, dynamic> json) =>
      _$GetUserRouteDMFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserRouteDMToJson(this);
}
