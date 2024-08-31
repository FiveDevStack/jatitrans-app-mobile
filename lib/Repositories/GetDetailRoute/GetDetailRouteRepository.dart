import 'package:flutter_package/flutter_package.dart';
import 'package:jatitrans_app/Core/Services/BaseServices.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/GetDetailRoute/DummyData/GetDetailRouteDummy.dart';
import 'package:jatitrans_app/Repositories/GetDetailRoute/Request/GetDetailRouteRequest.dart';
import 'package:jatitrans_app/Repositories/GetDetailRoute/Response/GetDetailRouteResponse.dart';
import 'package:jatitrans_app/Repositories/GetDetailRoute/ViewDataModel/GetDetailRouteDM.dart';
import 'package:jatitrans_app/Repositories/GetDetailRoute/ViewDataModel/StepRouteDM.dart';

class GetDetailRouteRepository extends BaseServices {
  static GetDetailRouteRepository? _instance;

  GetDetailRouteRepository._internal() {
    _instance = this;
  }

  factory GetDetailRouteRepository() =>
      _instance ?? GetDetailRouteRepository._internal();

  Future<BaseModelResponse> getDetailRoute(GetDetailRouteRequest param) async {
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      BaseModelResponse baseModelResponse =
          BaseModelResponse.fromJson(GetDetailRouteDummy().getDetailRouteDummy);

      if (baseModelResponse.data != null) {
        GetDetailRouteResponse responseData =
            GetDetailRouteResponse.fromJson(baseModelResponse.data);

        List<StepRouteDM> stepRouteList = [];

        responseData.stepRouteList?.forEach(
          (element) {
            StepRouteDM data = StepRouteDM();
            data.fromStationName = element.fromStationName;
            data.id = element.id;
            data.nextDestinationDistance = element.nextDestinationDistance;
            data.nextDestinationTime = element.nextDestinationTime;
            data.price = element.price;
            data.toStationName = element.toStationName;
            data.transportationId = data.transportationId;
            data.transportationName = data.transportationName;

            stepRouteList.add(data);
          },
        );

        GetDetailRouteDM dataDM = GetDetailRouteDM();
        dataDM.stepRouteList = stepRouteList;
        dataDM.distance = responseData.distance;
        dataDM.routeName = responseData.routeName;
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
