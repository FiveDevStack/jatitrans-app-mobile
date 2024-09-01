import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Utils/CacheManager.dart';
import 'package:jatitrans_app/Features/FastTransport/RouteListPage/RouteListPage.dart';
import 'package:jatitrans_app/Repositories/GetRoute/Request/GetRouteRequest.dart';
import 'package:jatitrans_app/Repositories/Login/ViewDataModel/LoginDM.dart';

class SettingLocationPageController extends GetxController with CacheManager {
  TextEditingController fromLocationController = TextEditingController();
  TextEditingController toLocationController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  RxBool enableButton = false.obs;

  LoginDM? loginData;

  @override
  void onInit() async {
    // TODO: implement onInit

    fromLocationController.addListener(
      () {
        validateInput();
      },
    );

    toLocationController.addListener(
      () {
        validateInput();
      },
    );

    loginData = await getLoginData();

    super.onInit();
  }

  validateInput() {
    if (fromLocationController.text.isNotEmpty &&
        toLocationController.text.isNotEmpty) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }

  gotoNext() {
    GetRouteRequest param = GetRouteRequest();
    param.email = loginData?.email;
    param.fullName = loginData?.fullName;
    param.price = priceController.text;
    param.fromLat = "";
    param.fromLong = "";
    param.toLat = "";
    param.toLong = "";

    Get.to(
      () => RouteListPage(getRouteRequest: param),
    );
  }
}
