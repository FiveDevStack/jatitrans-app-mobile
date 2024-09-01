import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatitrans_app/Core/Services/Model/BaseModelResponse.dart';
import 'package:jatitrans_app/Repositories/GetBarcodeTicket/GetBarcodeTicketRepository.dart';
import 'package:jatitrans_app/Repositories/GetBarcodeTicket/Request/GetBarcodeTicketRequest.dart';
import 'package:jatitrans_app/Repositories/GetBarcodeTicket/ViewDataModel/GetBarcodeTicketDM.dart';

class UserTicketPageController extends GetxController {
  final GetBarcodeTicketRequest param;

  BuildContext context;

  Rx<GetBarcodeTicketDM> getBarcodeTicketDM = GetBarcodeTicketDM().obs;
  RxBool isLoading = false.obs;

  UserTicketPageController({
    required this.param,
    required this.context,
  });

  @override
  void onInit() {
    // TODO: implement onInit
    getBarcode();
    super.onInit();
  }

  getBarcode() async {
    isLoading.value = true;

    BaseModelResponse response =
        await GetBarcodeTicketRepository().getTicketBarcode(param);

    isLoading.value = false;

    if (response.status?.code == 200) {
      getBarcodeTicketDM.value = response.data;
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
