import 'package:flutter_package/flutter_package.dart';
import 'package:jatitrans_app/Core/Services/BaseServices.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/GetBarcodeTicket/DummyData/GetBarcodeTicketDummy.dart';
import 'package:jatitrans_app/Repositories/GetBarcodeTicket/Request/GetBarcodeTicketRequest.dart';
import 'package:jatitrans_app/Repositories/GetBarcodeTicket/Response/GetBarcodeTicketResponse.dart';
import 'package:jatitrans_app/Repositories/GetBarcodeTicket/ViewDataModel/GetBarcodeTicketDM.dart';

class GetBarcodeTicketRepository extends BaseServices {
  static GetBarcodeTicketRepository? _instance;

  GetBarcodeTicketRepository._internal() {
    _instance = this;
  }

  factory GetBarcodeTicketRepository() =>
      _instance ?? GetBarcodeTicketRepository._internal();

  Future<BaseModelResponse> getTicketBarcode(
      GetBarcodeTicketRequest param) async {
    try {
      // Change this with API data (now Still dummy)
      await Future.delayed(const Duration(milliseconds: 600));
      // var response = LoginDummyData().loginDummyData;

      // var response = await postApi(
      //   params: param.toJson(),
      //   endpoint: APIEndpoint.login,
      // );

      // LogUtility.writeLog('data : ${response.data}');

      BaseModelResponse baseModelResponse = BaseModelResponse.fromJson(
          GetBarcodeTicketDummy().getBarcodeTickerDummy);

      if (baseModelResponse.data != null) {
        // LoginResponse responseData =
        //     LoginResponse.fromJson(baseModelResponse.data);
        // LoginDM loginDM = LoginDM();

        // loginDM.email = responseData.email;
        // loginDM.fullName = responseData.fullName;

        GetBarcodeTicketResponse responseData =
            GetBarcodeTicketResponse.fromJson(baseModelResponse.data);

        GetBarcodeTicketDM dataDM = GetBarcodeTicketDM();
        dataDM.imageBarcode = responseData.imageBarcode;
        dataDM.price = responseData.price;
        dataDM.stationName = responseData.stationName;
        dataDM.status = responseData.status;
        dataDM.transportationName = responseData.transportationName;

        BaseModelResponse baseData = BaseModelResponse();

        baseData.status = baseModelResponse.status;
        baseData.data = dataDM;

        return baseData;
      } else {
        return baseModelResponse;
      }
    } catch (e) {
      LogUtility.writeLog("error : $e");
      return BaseModelResponse();
    }
  }
}
