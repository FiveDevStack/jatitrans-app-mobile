import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';
import 'package:jatitrans_app/Features/FastTransport/SettingLocationPage/Controller/SettingLocationPageController.dart';

class SettingLocationPage extends StatelessWidget {
  const SettingLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SettingLocationPageController());
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: const Text(
          'Fast Transport',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: const CText(
                        text: 'Where you want to go? please let us know',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const CText(
                  text: 'From',
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                CTextInput(
                  textController: _controller.fromLocationController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CText(
                  text: 'To',
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                CTextInput(
                  textController: _controller.toLocationController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(),
                const CText(
                  text: 'Your Reference Price (Rp) - Optional',
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                CTextInput(
                  textController: _controller.priceController,
                  keyboardType: TextInputType.number,
                  prefixText: 'Rp. ',
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Obx(
                    () => CustomButton(
                      onPressed: () {
                        _controller.gotoNext();
                      },
                      enableButton: _controller.enableButton.value,
                      backgroundColors: VColor.primaryColors,
                      backgroundDisableColors:
                          VColor.primaryColors.withOpacity(0.5),
                      titleButton: 'Next',
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
