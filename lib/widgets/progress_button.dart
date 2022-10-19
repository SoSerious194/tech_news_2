import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProgressButton extends StatelessWidget {
  final double? width;
  final Color? color;
  final Color? progressColor;
  const ProgressButton({
    Key? key,
    this.width,
    this.color,
    this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color ?? AppColors.accentColor,
      ),
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            color: progressColor ?? AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
