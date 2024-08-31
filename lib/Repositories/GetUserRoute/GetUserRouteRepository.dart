import 'package:flutter_package/flutter_package.dart';
import 'package:jatitrans_app/Core/Services/BaseServices.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/GetUserRoute/DummyData/GetUserRouteDummy.dart';
import 'package:jatitrans_app/Repositories/GetUserRoute/Request/GetUserRouteRequest.dart';
import 'package:jatitrans_app/Repositories/GetUserRoute/Response/GetUserRouteResponse.dart';
import 'package:jatitrans_app/Repositories/GetUserRoute/ViewDataModel/GetUserRouteDM.dart';
import 'package:jatitrans_app/Repositories/GetUserRoute/ViewDataModel/StepUserRouteDM.dart';

class GetUserRouteRepository extends BaseServices {
  static GetUserRouteRepository? _instance;

  GetUserRouteRepository._internal() {
    _instance = this;
  }

  factory GetUserRouteRepository() =>
      _instance ?? GetUserRouteRepository._internal();

  Future<BaseModelResponse> getRoute(GetUserRouteRequest param) async {
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      BaseModelResponse baseModelResponse =
          BaseModelResponse.fromJson(GetUserRouteDummy().getUserRouteDummy);

      if (baseModelResponse.data != null) {
        GetUserRouteResponse responseData =
            GetUserRouteResponse.fromJson(baseModelResponse.data);

        List<StepUserRouteDM> listUserRoute = [];

        responseData.stepRouteList?.forEach(
          (element) {
            StepUserRouteDM data = StepUserRouteDM();
            data.fromStationName = element.fromStationName;
            data.id = element.id;
            data.nextDestinationDistance = element.nextDestinationDistance;
            data.nextDestinationTime = element.nextDestinationTime;
            data.price = element.price;
            data.statusItem = element.statusItem;
            data.toStationName = data.toStationName;
            data.transportationId = data.transportationId;
            data.transportationName = data.transportationName;

            listUserRoute.add(data);
          },
        );

        GetUserRouteDM dataDM = GetUserRouteDM();
        dataDM.stepRouteList = listUserRoute;
        dataDM.distance = responseData.distance;
        dataDM.routeName = responseData.routeName;
        dataDM.status = responseData.status;
        dataDM.totalPrice = responseData.totalPrice;
        dataDM.totalTime = responseData.totalTime;

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
