import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Core/Utils/CacheManager.dart';
import 'package:jatitrans_app/Features/UserAction/UserTicket/UserTicketPage.dart';
import 'package:jatitrans_app/Repositories/GetBarcodeTicket/Request/GetBarcodeTicketRequest.dart';
import 'package:jatitrans_app/Repositories/GetUserRoute/GetUserRouteRepository.dart';
import 'package:jatitrans_app/Repositories/GetUserRoute/Request/GetUserRouteRequest.dart';
import 'package:jatitrans_app/Repositories/GetUserRoute/ViewDataModel/GetUserRouteDM.dart';
import 'package:jatitrans_app/Repositories/GetUserRoute/ViewDataModel/StepUserRouteDM.dart';
import 'package:jatitrans_app/Repositories/Login/ViewDataModel/LoginDM.dart';

class UserRouteController extends GetxController with CacheManager {
  RxBool isLoading = false.obs;
  Rx<GetUserRouteDM> userRoute = GetUserRouteDM().obs;

  LoginDM? loginData;

  final String routeId;

  BuildContext context;

  UserRouteController({
    required this.routeId,
    required this.context,
  });

  @override
  void onInit() async {
    // TODO: implement onInit
    loginData = await getLoginData();
    getUserRoute();

    super.onInit();
  }

  getUserRoute() async {
    isLoading.value = true;
    GetUserRouteRequest param = GetUserRouteRequest();
    param.email = loginData?.email;
    param.fullName = loginData?.fullName;
    param.routeId = routeId;

    BaseModelResponse responseData =
        await GetUserRouteRepository().getRoute(param);

    isLoading.value = false;
    if (responseData.status?.code == 200) {
      userRoute.value = responseData.data;
    } else {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error!',
          message: '${responseData.status?.message}',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  gotoTicket(StepUserRouteDM data) {
    GetBarcodeTicketRequest param = GetBarcodeTicketRequest();
    param.email = loginData?.email;
    param.fullName = loginData?.fullName;
    param.routeId = routeId;
    param.stepItemId = data.id;
    param.statusItem = data.statusItem;

    Get.to(() => UserTicketPage(
          param: param,
        ));
  }
}
