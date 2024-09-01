import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/GlobalComponent/RouteCardItemV2.dart';
import 'package:jatitrans_app/Core/Helpers/Helpers.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';
import 'package:jatitrans_app/Features/FastTransport/DetailRoute/Controller/DetailRoutePageController.dart';

class DetailRoutePage extends StatelessWidget {
  const DetailRoutePage({super.key, required this.routeId});

  final String routeId;

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(DetailRoutePageController(
      routeId: routeId,
      context: context,
    ));
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: Text(
          'Detail Route',
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: VColor.secondaryColors,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => CText(
                            text:
                                _controller.getDetailRouteDM.value.routeName ??
                                    "-",
                            fontWeight: FontWeight.bold,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: VColor.undoneColors,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.watch_later,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => CText(
                            text: Helpers().convertToHoursMinutes(
                              _controller.getDetailRouteDM.value.totalTime ??
                                  "00:00:00",
                            ),
                            fontWeight: FontWeight.bold,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: VColor.upcomingColors,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => CText(
                            text:
                                "${_controller.getDetailRouteDM.value.distance ?? "0.0"} Km",
                            textColor: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: VColor.doneColors,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.wallet,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => CText(
                            text:
                                "Rp.${Helpers().reformatAmount(int.parse(_controller.getDetailRouteDM.value.totalPrice ?? "0"))}",
                            textColor: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () =>
                        (_controller.getDetailRouteDM.value.stepRouteList ?? [])
                                .isNotEmpty
                            ? ListView.builder(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                  bottom: 100,
                                ),
                                shrinkWrap: true,
                                itemCount: _controller.getDetailRouteDM.value
                                    .stepRouteList?.length,
                                itemBuilder: (context, index) {
                                  var data = (_controller.getDetailRouteDM.value
                                          .stepRouteList ??
                                      [])[index];
                                  return RouteCardItemV2(
                                    fromLocation: data.fromStationName ?? "",
                                    toLocation: data.toStationName ?? "",
                                    transportationName:
                                        data.transportationName ?? "",
                                    nextDestinationTime:
                                        data.nextDestinationTime ?? "00:00:00",
                                    nextDestinationDistance:
                                        data.nextDestinationDistance ?? "",
                                    price: data.price ?? "0",
                                  );
                                },
                              )
                            : const SizedBox(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  bottom: 50, left: 20, right: 20, top: 20),
              child: CustomButton(
                onPressed: () {
                  _controller.confirmPayBill();
                },
                backgroundColors: VColor.primaryColors,
                backgroundDisableColors: VColor.primaryColors.withOpacity(0.5),
                titleButton: 'Pay Bill',
              ),
            ),
          ),
          Obx(
            () => _controller.isLoading.value
                ? const DefaultScreenLoading()
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
