import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Helpers/Helpers.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';
import 'package:jatitrans_app/Features/UserAction/UserTicket/Controller/UserTicketPageController.dart';
import 'package:jatitrans_app/Repositories/GetBarcodeTicket/Request/GetBarcodeTicketRequest.dart';

class UserTicketPage extends StatelessWidget {
  const UserTicketPage({super.key, required this.param});

  final GetBarcodeTicketRequest param;

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(UserTicketPageController(
      context: context,
      param: param,
    ));
    return BaseWidgetContainer(
        appBar: BaseAppBar.baseAppBar(
          context,
          title: Text(
            'Your Ticket',
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: "Halte/Station Name :",
                      fontWeight: FontWeight.bold,
                      // fontSize: 18,
                    ),
                    Obx(
                      () => CText(
                          text: _controller
                                  .getBarcodeTicketDM.value.stationName ??
                              "-"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    CText(
                      text: "Transportation :",
                      fontWeight: FontWeight.bold,
                      // fontSize: 18,
                    ),
                    Obx(
                      () => CText(
                          text: _controller.getBarcodeTicketDM.value
                                  .transportationName ??
                              "-"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    CText(
                      text: "Price :",
                      fontWeight: FontWeight.bold,
                      // fontSize: 18,
                    ),
                    Obx(
                      () => CText(
                          text:
                              "Rp.${Helpers().reformatAmount(int.parse(_controller.getBarcodeTicketDM.value.price ?? "0"))}"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    CText(
                      text: "Status :",
                      fontWeight: FontWeight.bold,
                      // fontSize: 18,
                    ),
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: VColor.yellowColors,
                            borderRadius: BorderRadius.circular(10)),
                        child: CText(
                            text: _controller.getBarcodeTicketDM.value.status ??
                                "-"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Image.asset(
                        _controller.getBarcodeTicketDM.value.imageBarcode ?? "",
                        // height: 100,
                        // width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => _controller.isLoading.value
                  ? const DefaultScreenLoading(
                      backgroundColor: Colors.white,
                    )
                  : const SizedBox(),
            )
          ],
        ));
  }
}
