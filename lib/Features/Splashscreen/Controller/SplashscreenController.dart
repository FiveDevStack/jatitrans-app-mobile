import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Utils/CacheManager.dart';
import 'package:jatitrans_app/Features/HomePage/HomePage.dart';
import 'package:jatitrans_app/Features/Login/LoginPage.dart';

class SplashscreenPageController extends GetxController with CacheManager {
  @override
  void onInit() async {
    super.onInit();
    splasScreenStart();
  }

  splasScreenStart() async {
    bool loginStatus = await getLoginStatus();
    await Future.delayed(const Duration(seconds: 1));

    if (loginStatus) {
      Get.offAll(() => const HomePage());
    } else {
      Get.offAll(() => const LoginPage());
    }
  }
}
