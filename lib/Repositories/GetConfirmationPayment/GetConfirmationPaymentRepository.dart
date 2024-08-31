import 'package:flutter_package/flutter_package.dart';
import 'package:jatitrans_app/Core/Services/BaseServices.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/GetConfirmationPayment/DummyData/GetConfirmationPaymentDummy.dart';
import 'package:jatitrans_app/Repositories/GetConfirmationPayment/Request/GetConfirmationPaymentRequest.dart';
import 'package:jatitrans_app/Repositories/GetConfirmationPayment/Response/GetConfirmationPaymentResponse.dart';
import 'package:jatitrans_app/Repositories/GetConfirmationPayment/ViewDataModel/GetConfirmationPaymentDM.dart';

class GetConfirmationPaymentRepository extends BaseServices {
  static GetConfirmationPaymentRepository? _instance;

  GetConfirmationPaymentRepository._internal() {
    _instance = this;
  }

  factory GetConfirmationPaymentRepository() =>
      _instance ?? GetConfirmationPaymentRepository._internal();

  Future<BaseModelResponse> getConfirmationPayment(
      GetConfirmationPaymentRequest param) async {
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
          GetConfirmationPaymentDummy().getConfirmationPaymentDummy);

      if (baseModelResponse.data != null) {
        // LoginResponse responseData =
        //     LoginResponse.fromJson(baseModelResponse.data);
        // LoginDM loginDM = LoginDM();

        GetConfirmationPaymentResponse responseData =
            GetConfirmationPaymentResponse.fromJson(baseModelResponse.data);

        GetConfirmationPaymentDM dataDM = GetConfirmationPaymentDM();
        dataDM.distance = responseData.distance;
        dataDM.routeName = responseData.routeName;
        dataDM.serviceFee = responseData.serviceFee;
        dataDM.totalPrice = responseData.totalPrice;
        dataDM.totalTime = responseData.totalTime;

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
