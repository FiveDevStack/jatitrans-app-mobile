import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Core/Utils/CacheManager.dart';
import 'package:jatitrans_app/Core/Utils/ImagesConstant.dart';
import 'package:jatitrans_app/Features/HomePage/HomePage.dart';
import 'package:jatitrans_app/Repositories/Login/LoginRepository.dart';
import 'package:jatitrans_app/Repositories/Login/Request/LoginRequest.dart';
import 'package:jatitrans_app/Repositories/Login/ViewDataModel/LoginDM.dart';

class LoginPageController extends GetxController with CacheManager {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool obsecurePassword = true.obs;
  RxBool enableButton = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(
      () {
        validateInput();
      },
    );

    passwordController.addListener(
      () {
        validateInput();
      },
    );
  }

  validateInput() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }

  changeObsecure() {
    obsecurePassword.value = !obsecurePassword.value;
  }

  doLogin(context) async {
    isLoading.value = true;

    LoginRequest param = LoginRequest();
    param.email = emailController.text;
    param.password = passwordController.text;

    BaseModelResponse baseModelResponse =
        await LoginRepository().doLoginData(param);

    if (baseModelResponse.status?.code == 200) {
      isLoading.value = false;
      LoginDM dataLogin = baseModelResponse.data;
      setLoginStatus(true);
      saveLoginData(dataLogin);

      Get.offAll(() => const HomePage());
    } else {
      isLoading.value = false;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialogComponent(
            imageAssets: ImagesConstant.failedIcon,
            message: "Failed",
            description: baseModelResponse.status?.message ??
                "Password or Username incorrect",
            withAction: true,
          );
        },
      );
    }
  }
}
