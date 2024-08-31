import 'package:flutter_package/flutter_package.dart';
import 'package:jatitrans_app/Core/Services/BaseServices.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/Register/DummyData/RegisterDummyData.dart';
import 'package:jatitrans_app/Repositories/Register/Request/RegisterRequest.dart';

class RegisterRepository extends BaseServices {
  static RegisterRepository? _instance;

  RegisterRepository._internal() {
    _instance = this;
  }

  factory RegisterRepository() => _instance ?? RegisterRepository._internal();

  Future<BaseModelResponse> doRegisterData(RegisterRequest param) async {
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
          BaseModelResponse.fromJson(RegisterDummyData().registerDummy);

      // if (baseModelResponse.data != null) {
      //   LoginResponse responseData =
      //       LoginResponse.fromJson(baseModelResponse.data);
      //   LoginDM loginDM = LoginDM();

      //   loginDM.email = responseData.email;
      //   loginDM.fullName = responseData.fullName;

      //   BaseModelResponse baseData = BaseModelResponse();

      //   baseData.status = baseModelResponse.status;
      //   baseData.data = loginDM;

      //   return baseData;
      // } else {
      // }
      return baseModelResponse;
    } catch (e) {
      LogUtility.writeLog("error : $e");
      return BaseModelResponse();
    }
  }
}
