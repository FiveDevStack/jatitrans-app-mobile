import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Utils/ImagesConstant.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';
import 'package:jatitrans_app/Features/Splashscreen/Controller/SplashscreenController.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SplashscreenPageController());
    return BaseWidgetContainer(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesConstant.appIcon,
                  width: 90,
                  height: 90,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CText(
                  text: 'JATITRANS',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 50.0,
            ),
            child: CircularProgressIndicator(
              color: VColor.secondaryColors,
            ),
          ),
        ],
      ),
    );
  }
}
