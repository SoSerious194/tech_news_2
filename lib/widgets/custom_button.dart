import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color? fontColor;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.width,
    this.textStyle,
    this.height,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color ?? AppColors.accentColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style:
                textStyle ?? AppStyles.buttonStyle.copyWith(color: fontColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
