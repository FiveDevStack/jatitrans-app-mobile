import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:jatitrans_app/Core/Helpers/Helpers.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';
import 'package:jatitrans_app/Repositories/GetConfirmationPayment/ViewDataModel/GetConfirmationPaymentDM.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment(
      {super.key, required this.onPressed, required this.data});

  final VoidCallback onPressed;

  final GetConfirmationPaymentDM data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstantUtils.getFullWidth(context) * 1.2,
      width: ConstantUtils.getFullWidth(context),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  text: "Confirm Your Transaction",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                      CText(
                        text: data.routeName ?? "",
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white,
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
                      CText(
                        text: Helpers().convertToHoursMinutes(
                          data.totalTime ?? "00:00:00",
                        ),
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white,
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
                      CText(
                        text: "${data.distance} Km",
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
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
                      CText(
                        text:
                            "Rp.${Helpers().reformatAmount(int.parse(data.totalPrice ?? "0"))}",
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
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
                      color: VColor.monitorColors,
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
                      CText(
                        text:
                            "Rp.${Helpers().reformatAmount(int.parse(data.serviceFee ?? "0"))}",
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
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
                onPressed: onPressed,
                backgroundColors: VColor.primaryColors,
                backgroundDisableColors: VColor.primaryColors.withOpacity(0.5),
                titleButton: 'Pay Bill',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
