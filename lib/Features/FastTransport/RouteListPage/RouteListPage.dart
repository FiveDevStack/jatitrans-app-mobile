import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/GlobalComponent/RouteCardItem.dart';
import 'package:jatitrans_app/Features/FastTransport/RouteListPage/Controller/RouteListPageController.dart';
import 'package:jatitrans_app/Repositories/GetRoute/Request/GetRouteRequest.dart';

class RouteListPage extends StatelessWidget {
  const RouteListPage({
    super.key,
    required this.getRouteRequest,
  });

  final GetRouteRequest getRouteRequest;

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(RouteListPageController(
      context: context,
      getRouteRequest: getRouteRequest,
    ));
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: Text(
          'Route List',
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  text: 'Choose your route',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Obx(
                    () => (_controller.getRouteDM.value.listRoute ?? [])
                            .isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                              bottom: 30,
                            ),
                            itemCount:
                                _controller.getRouteDM.value.listRoute?.length,
                            itemBuilder: (context, index) {
                              var data = _controller
                                  .getRouteDM.value.listRoute?[index];
                              return RouteCardItem(
                                routeName: data?.routeName ?? "",
                                distance: data?.distance ?? "",
                                time: data?.time ?? "",
                                price: data?.totalPrice ?? "",
                                onTap: () {
                                  _controller.gotoRouteDetail(data);
                                },
                              );
                            },
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
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
