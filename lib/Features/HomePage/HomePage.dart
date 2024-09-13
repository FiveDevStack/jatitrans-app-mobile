import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Utils/ImagesConstant.dart';
import 'package:jatitrans_app/Core/Utils/Parameters.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';
import 'package:jatitrans_app/Features/HistoryPage/HistoryPage.dart';
import 'package:jatitrans_app/Features/HomePage/Component/Sidebar.dart';
import 'package:jatitrans_app/Features/HomePage/Controller/HomePageController.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(HomePageController(context: context));
    return BaseWidgetContainer(
      drawer: Obx(
        () => Sidebar(
          username: _controller.loginData.value.fullName,
          screenKey: "",
          onLogoutPress: () {
            _controller.doLogout();
          },
          onHistoryPress: () {
            _controller.goToHistory();
          },
          onHomePress: () {
            _controller.goToHome();
          },
        ),
      ),
      appBar: BaseAppBar.baseAppBar(context,
          title: Obx(
            () => Text(
              _controller.appBarText.value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: getWidget(_controller, context),
    );
  }

  getWidget(HomePageController controller, context) {
    return Obx(
      () {
        if (controller.screenKey.value == ScreenKey.homePage.name) {
          return homepageWidget(controller, context);
        } else {
          return HistoryPage(
              // scrollController: controller.historyScrollController,
              );
        }
      },
    );
  }

  homepageWidget(HomePageController controller, context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: controller.homeScrollController,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImagesConstant.appIcon,
                      scale: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: ConstantUtils.getFullWidth(context) * 0.3,
                      child: Text(
                        controller.loginData.value.fullName ?? "",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    controller.gotoSettingLocationFastTransport();
                  },
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    width: ConstantUtils.getFullWidth(context),
                    height: 150,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            ImagesConstant.publicTransportBackground,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CText(
                        text: "Fast Transport",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? const DefaultScreenLoading()
              : const SizedBox(),
        )
      ],
    );
  }
}
