import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key, required this.icon, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: AppColors.whiteColor,
          size: 22,
        ),
      ),
    );
  }
}
