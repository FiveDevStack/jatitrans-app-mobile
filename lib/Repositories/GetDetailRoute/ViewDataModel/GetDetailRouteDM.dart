import 'package:jatitrans_app/Repositories/GetDetailRoute/ViewDataModel/StepRouteDM.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetDetailRouteDM.g.dart';

@JsonSerializable()
class GetDetailRouteDM {
  String? routeName;
  String? totalTime;
  String? totalPrice;
  String? distance;
  List<StepRouteDM>? stepRouteList;

  GetDetailRouteDM({
    this.routeName,
    this.totalTime,
    this.totalPrice,
    this.distance,
    this.stepRouteList,
  });

  factory GetDetailRouteDM.fromJson(Map<String, dynamic> json) =>
      _$GetDetailRouteDMFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailRouteDMToJson(this);
}
