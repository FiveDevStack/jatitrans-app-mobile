import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/utils/ccolor_utils.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Core/Utils/CacheManager.dart';
import 'package:jatitrans_app/Features/FastTransport/DetailRoute/Component/ConfirmPayment.dart';
import 'package:jatitrans_app/Features/UserAction/UserRoute/UserRoute.dart';
import 'package:jatitrans_app/Repositories/GetConfirmationPayment/GetConfirmationPaymentRepository.dart';
import 'package:jatitrans_app/Repositories/GetConfirmationPayment/Request/GetConfirmationPaymentRequest.dart';
import 'package:jatitrans_app/Repositories/GetConfirmationPayment/ViewDataModel/GetConfirmationPaymentDM.dart';
import 'package:jatitrans_app/Repositories/GetDetailRoute/GetDetailRouteRepository.dart';
import 'package:jatitrans_app/Repositories/GetDetailRoute/Request/GetDetailRouteRequest.dart';
import 'package:jatitrans_app/Repositories/GetDetailRoute/ViewDataModel/GetDetailRouteDM.dart';
import 'package:jatitrans_app/Repositories/Login/ViewDataModel/LoginDM.dart';
import 'package:jatitrans_app/Repositories/PaymentBill/PaymentBillRepository.dart';
import 'package:jatitrans_app/Repositories/PaymentBill/Request/PaymentBillRequest.dart';

class DetailRoutePageController extends GetxController with CacheManager {
  String routeId;
  LoginDM? loginData;
  BuildContext context;

  RxBool isLoading = false.obs;
  Rx<GetDetailRouteDM> getDetailRouteDM = GetDetailRouteDM().obs;
  Rx<GetConfirmationPaymentDM> confirmationData =
      GetConfirmationPaymentDM().obs;

  DetailRoutePageController({
    required this.routeId,
    required this.context,
  });

  @override
  void onInit() async {
    // TODO: implement onInit
    loginData = await getLoginData();
    getDetailRoute();
    super.onInit();
  }

  getDetailRoute() async {
    isLoading.value = true;
    GetDetailRouteRequest param = GetDetailRouteRequest();
    param.email = loginData?.email;
    param.fullName = loginData?.fullName;
    param.routeId = routeId;

    BaseModelResponse response =
        await GetDetailRouteRepository().getDetailRoute(param);

    isLoading.value = false;
    if (response.status?.code == 200) {
      getDetailRouteDM.value = response.data;
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
  }

  confirmPayBill() async {
    isLoading.value = true;

    GetConfirmationPaymentRequest param = GetConfirmationPaymentRequest();
    param.email = loginData?.email;
    param.fullName = loginData?.fullName;
    param.routeId = routeId;

    BaseModelResponse response =
        await GetConfirmationPaymentRepository().getConfirmationPayment(param);

    isLoading.value = false;
    if (response.status?.code == 200) {
      confirmationData.value = response.data;
      Get.bottomSheet(
        ConfirmPayment(
          data: confirmationData.value,
          onPressed: () {
            Get.back();
            payBill();
          },
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled:
            true, // Set to true if the bottom sheet content needs more space
      );
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
  }

  payBill() async {
    isLoading.value = true;
    PaymentBillRequest param = PaymentBillRequest();
    param.email = loginData?.email;
    param.fullName = loginData?.fullName;
    param.methodPaymentId = "02";
    param.routeId = routeId;
    param.serviceFee = confirmationData.value.serviceFee;
    param.totalPrice = confirmationData.value.totalPrice;

    BaseModelResponse response =
        await PaymentBillRepository().paymentBill(param);

    isLoading.value = false;
    if (response.status?.code == 200) {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Success!',
          message: '${response.status?.message}, enjoy your ride',
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      Get.close(3);

      Get.to(() => UserRoute(routeId: routeId));
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
  }
}
