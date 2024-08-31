import 'package:flutter_package/flutter_package.dart';
import 'package:jatitrans_app/Core/Services/BaseServices.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/GetRoute/DummyData/GetRouteDummyData.dart';
import 'package:jatitrans_app/Repositories/GetRoute/Request/GetRouteRequest.dart';
import 'package:jatitrans_app/Repositories/GetRoute/Response/GetRouteResponse.dart';
import 'package:jatitrans_app/Repositories/GetRoute/ViewDataModel/GetRouteDM.dart';
import 'package:jatitrans_app/Repositories/GetRoute/ViewDataModel/RouteDataDM.dart';

class GetRouteRepository extends BaseServices {
  static GetRouteRepository? _instance;

  GetRouteRepository._internal() {
    _instance = this;
  }

  factory GetRouteRepository() => _instance ?? GetRouteRepository._internal();

  Future<BaseModelResponse> getRoute(GetRouteRequest param) async {
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      BaseModelResponse baseModelResponse =
          BaseModelResponse.fromJson(GetRouteDummyData().getRouteDummy);

      if (baseModelResponse.data != null) {
        GetRouteResponse responseData =
            GetRouteResponse.fromJson(baseModelResponse.data);

        List<RouteDataDM> listRoute = [];

        responseData.listRoute?.forEach(
          (element) {
            RouteDataDM data = RouteDataDM();
            data.distance = element.distance;
            data.id = element.id;
            data.routeName = element.routeName;
            data.time = element.time;
            data.totalPrice = element.totalPrice;

            listRoute.add(data);
          },
        );

        GetRouteDM dataDM = GetRouteDM();
        dataDM.listRoute = listRoute;

        baseModelResponse.data = dataDM;

        return baseModelResponse;
      } else {
        return baseModelResponse;
      }
    } catch (e) {
      LogUtility.writeLog("error : $e");
      return BaseModelResponse();
    }
  }
}
