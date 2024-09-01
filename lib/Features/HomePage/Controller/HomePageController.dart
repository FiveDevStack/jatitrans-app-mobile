import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Utils/CacheManager.dart';
import 'package:jatitrans_app/Core/Utils/Parameters.dart';
import 'package:jatitrans_app/Features/FastTransport/SettingLocationPage/SettingLocationPage.dart';
import 'package:jatitrans_app/Features/Login/LoginPage.dart';
import 'package:jatitrans_app/Repositories/Login/ViewDataModel/LoginDM.dart';

class HomePageController extends GetxController with CacheManager {
  BuildContext context;

  Rx<LoginDM> loginData = LoginDM().obs;
  // Rx<GetActiveJobDM> jobData = GetActiveJobDM().obs;
  RxString screenKey = ScreenKey.homePage.name.obs;

  RxString appBarText = "".obs;

  RxBool isLoading = false.obs;

  HomePageController({required this.context});

  ScrollController homeScrollController = ScrollController();
  ScrollController historyScrollController = ScrollController();

  @override
  void onInit() async {
    loginData.value = await getLoginData();
    // getListJob();
    _initScrolling();
    super.onInit();
  }

  _initScrolling() {
    homeScrollController.addListener(
      () {
        double position = homeScrollController.position.pixels;

        setAppBarTitle(position);
      },
    );

    historyScrollController.addListener(
      () {
        double position = historyScrollController.position.pixels;

        setAppBarTitle(position);
      },
    );
  }

  doLogout() async {
    removeLoginData();
    setLoginStatus(false);

    Get.offAll(() => const LoginPage());
  }

  goToHome() {
    if (screenKey.value != ScreenKey.homePage.name) {
      screenKey.value = ScreenKey.homePage.name;
      Get.back();

      appBarText.value = "";
      // getListJob();
      // setAppBarTitle();
    }
  }

  goToHistory() {
    if (screenKey.value != ScreenKey.historyPage.name) {
      screenKey.value = ScreenKey.historyPage.name;
      Get.back();

      // if (Get.isRegistered<HistoryPageController>()) {
      //   var controller = Get.find<HistoryPageController>();

      //   appBarText.value = "";
      //   controller.getHistoryJob();
      //   // setAppBarTitle();
      // }
    }
  }

  setAppBarTitle(double position) {
    if (position > 50) {
      if (screenKey.value == ScreenKey.historyPage.name) {
        appBarText.value = "History Job";
      } else {
        appBarText.value = "List Job";
      }
    } else {
      appBarText.value = "";
    }
  }

  gotoSettingLocationFastTransport() {
    Get.to(() => const SettingLocationPage());
  }
}
