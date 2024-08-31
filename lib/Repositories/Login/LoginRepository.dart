import 'package:flutter_package/flutter_package.dart';
import 'package:jatitrans_app/Core/Services/BaseServices.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/Login/DummyData/LoginDummyData.dart';
import 'package:jatitrans_app/Repositories/Login/Request/LoginRequest.dart';
import 'package:jatitrans_app/Repositories/Login/Response/LoginResponse.dart';
import 'package:jatitrans_app/Repositories/Login/ViewDataModel/LoginDM.dart';

class LoginRepository extends BaseServices {
  static LoginRepository? _instance;

  LoginRepository._internal() {
    _instance = this;
  }

  factory LoginRepository() => _instance ?? LoginRepository._internal();

  Future<BaseModelResponse> doLoginData(LoginRequest param) async {
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
          BaseModelResponse.fromJson(LoginDummyData().loginDummyData);

      if (baseModelResponse.data != null) {
        LoginResponse responseData =
            LoginResponse.fromJson(baseModelResponse.data);
        LoginDM loginDM = LoginDM();

        loginDM.email = responseData.email;
        loginDM.fullName = responseData.fullName;

        BaseModelResponse baseData = BaseModelResponse();

        baseData.status = baseModelResponse.status;
        baseData.data = loginDM;

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
