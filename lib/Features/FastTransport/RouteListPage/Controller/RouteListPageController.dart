import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Core/Utils/CacheManager.dart';
import 'package:jatitrans_app/Features/FastTransport/DetailRoute/DetailRoutePage.dart';
import 'package:jatitrans_app/Repositories/GetRoute/GetRouteRepository.dart';
import 'package:jatitrans_app/Repositories/GetRoute/Request/GetRouteRequest.dart';
import 'package:jatitrans_app/Repositories/GetRoute/ViewDataModel/GetRouteDM.dart';
import 'package:jatitrans_app/Repositories/GetRoute/ViewDataModel/RouteDataDM.dart';

class RouteListPageController extends GetxController with CacheManager {
  RxBool isLoading = false.obs;
  final GetRouteRequest getRouteRequest;

  BuildContext context;

  Rx<GetRouteDM> getRouteDM = GetRouteDM().obs;

  RouteListPageController(
      {required this.getRouteRequest, required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    getRouteList();
    super.onInit();
  }

  getRouteList() async {
    isLoading.value = true;
    GetRouteRequest param = GetRouteRequest();
    param = getRouteRequest;

    BaseModelResponse response = await GetRouteRepository().getRoute(param);
    if (response.status?.code == 200) {
      getRouteDM.value = response.data;
    } else {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error!',
          message: '${response.status?.message}',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }

    isLoading.value = false;
  }

  gotoRouteDetail(RouteDataDM? data) {
    Get.to(DetailRoutePage(routeId: data?.id ?? ""));
  }
}
