import 'package:flutter_package/flutter_package.dart';
import 'package:jatitrans_app/Core/Services/BaseServices.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/PaymentBill/DummyData/PaymentBillDummy.dart';
import 'package:jatitrans_app/Repositories/PaymentBill/Request/PaymentBillRequest.dart';
import 'package:jatitrans_app/Repositories/PaymentBill/Response/PaymentBillResponse.dart';
import 'package:jatitrans_app/Repositories/PaymentBill/ViewDataModel/PaymentBillDM.dart';

class PaymentBillRepository extends BaseServices {
  static PaymentBillRepository? _instance;

  PaymentBillRepository._internal() {
    _instance = this;
  }

  factory PaymentBillRepository() =>
      _instance ?? PaymentBillRepository._internal();

  Future<BaseModelResponse> paymentBill(PaymentBillRequest param) async {
    try {
      // Change this with API data (now Still dummy)
      await Future.delayed(const Duration(milliseconds: 600));
      // var response = LoginDummyData().loginDummyData;

      // var response = await postApi(
      //   params: param.toJson(),
      //   endpoint: APIEndpoint.login,
      // );

      // LogUtility.writeLog('data : ${response.data}');

      BaseModelResponse baseModelResponse =
          BaseModelResponse.fromJson(PaymentBillDummy().paymentBillDummyData);

      if (baseModelResponse.data != null) {
        PaymentBillResponse responseData =
            PaymentBillResponse.fromJson(baseModelResponse.data);
        PaymentBillDM dataDM = PaymentBillDM();

        dataDM.routeId = responseData.routeId;

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
