import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/utils/ccolor_utils.dart';

class DefaultScreenLoading extends StatelessWidget {
  final Color? indicatorColor;
  final Color? backgroundColor;
  const DefaultScreenLoading({
    super.key,
    this.indicatorColor = CColorUtils.primaryColors,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Container(
        color: backgroundColor ?? Colors.black.withOpacity(0.1),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: CircularProgressIndicator(
              color: indicatorColor ?? Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
