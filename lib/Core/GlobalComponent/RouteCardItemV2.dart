import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:jatitrans_app/Core/Helpers/Helpers.dart';
import 'package:jatitrans_app/Core/Utils/ImagesConstant.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';

class RouteCardItemV2 extends StatelessWidget {
  const RouteCardItemV2(
      {super.key,
      required this.fromLocation,
      required this.toLocation,
      required this.transportationName,
      required this.nextDestinationTime,
      required this.nextDestinationDistance,
      required this.price,
      this.showButton = false,
      this.buttonOnPressed});
  final String fromLocation;
  final String toLocation;
  final String transportationName;
  final String nextDestinationTime;
  final String nextDestinationDistance;
  final String price;
  final bool? showButton;
  final VoidCallback? buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImagesConstant.dotIcon,
          scale: 14,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(
              20,
            ),
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                const BoxShadow(
                  color: VColor.primaryColors,
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                  offset: const Offset(3, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CText(
                          text: "From : $fromLocation",
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.train),
                    const SizedBox(
                      width: 10,
                    ),
                    CText(
                      text: transportationName,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CText(
                          text: "To : $toLocation",
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_city,
                        ),
                        CText(
                          text: " $nextDestinationDistance Km",
                        ),
                      ],
                    ),
                    const CText(text: ','),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later,
                        ),
                        CText(
                          text:
                              " ${Helpers().convertToHoursMinutes(nextDestinationTime)}",
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                showButton ?? false
                    ? CustomButton(
                        onPressed: buttonOnPressed ?? () {},
                        backgroundColors: VColor.primaryColors,
                        backgroundDisableColors:
                            VColor.primaryColors.withOpacity(0.5),
                        titleButton: 'See Ticket',
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
