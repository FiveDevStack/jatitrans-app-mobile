import 'package:jatitrans_app/Repositories/GetRoute/ViewDataModel/RouteDataDM.dart';

import 'package:json_annotation/json_annotation.dart';

part 'GetRouteDM.g.dart';

@JsonSerializable()
class GetRouteDM {
  List<RouteDataDM>? listRoute;

  GetRouteDM({
    this.listRoute,
  });

  factory GetRouteDM.fromJson(Map<String, dynamic> json) =>
      _$GetRouteDMFromJson(json);

  Map<String, dynamic> toJson() => _$GetRouteDMToJson(this);
}
