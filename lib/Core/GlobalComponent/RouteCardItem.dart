import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:jatitrans_app/Core/Helpers/Helpers.dart';
import 'package:jatitrans_app/Core/Utils/VColor.dart';

class RouteCardItem extends StatelessWidget {
  const RouteCardItem(
      {super.key,
      required this.routeName,
      required this.distance,
      required this.time,
      required this.price,
      this.icon,
      this.onTap});
  final String routeName;
  final String distance;
  final String time;
  final String price;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                      Icons.location_city,
                    ),
                    CText(
                      text: " $distance Km",
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
                      text: " ${Helpers().convertToHoursMinutes(time)}",
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
                icon ?? const SizedBox(),
                CText(
                  text: routeName,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CText(text: 'Rp.${Helpers().reformatAmount(int.parse(price))}'),
          ],
        ),
      ),
    );
  }
}
