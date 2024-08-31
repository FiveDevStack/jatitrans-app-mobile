import 'package:flutter_package/flutter_package.dart';
import 'package:jatitrans_app/Core/Services/BaseServices.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/GetListPaymentMethod/DummyData/GetListPaymentMethodDummy.dart';
import 'package:jatitrans_app/Repositories/GetListPaymentMethod/Response/GetListPaymentMethodResponse.dart';
import 'package:jatitrans_app/Repositories/GetListPaymentMethod/ViewDataModel/GetListPaymentMethodDM.dart';
import 'package:jatitrans_app/Repositories/GetListPaymentMethod/ViewDataModel/ListPaymentMethodDM.dart';

class GetListPaymentMethodRepository extends BaseServices {
  static GetListPaymentMethodRepository? _instance;

  GetListPaymentMethodRepository._internal() {
    _instance = this;
  }

  factory GetListPaymentMethodRepository() =>
      _instance ?? GetListPaymentMethodRepository._internal();

  Future<BaseModelResponse> getListPayment() async {
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      BaseModelResponse baseModelResponse = BaseModelResponse.fromJson(
          GetListPaymentMethodDummy().getListPaymentMethodDummy);

      if (baseModelResponse.data != null) {
        GetListPaymentMethodResponse responseData =
            GetListPaymentMethodResponse.fromJson(baseModelResponse.data);

        List<ListPaymentMethodDM> listPayment = [];

        responseData.listPaymentMethod?.forEach(
          (element) {
            ListPaymentMethodDM data = ListPaymentMethodDM();
            data.id = element.id;
            data.name = element.name;

            listPayment.add(data);
          },
        );

        GetListPaymentMethodDM dataDM = GetListPaymentMethodDM();
        dataDM.listPaymentMethod = listPayment;

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
