import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppExtras {
  static double getDeviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getDeviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => page));
  }

  static void showToast({
    required BuildContext context,
    required String message,
    Color? bgColor,
    double? width,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppStyles.smallTextStyle,
        ),
        width: width,
        backgroundColor: bgColor ?? AppColors.primaryColor,
        margin: const EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showAlertDialog({
    required BuildContext context,
    required String title,
    required String description,
    String? cancelButton,
    String? acceptButton,
    required VoidCallback onCancel,
    required VoidCallback onAccept,
  }) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: AppStyles.mediumTextStyleBold,
        ),
        content: Text(
          description,
          style: AppStyles.smallTextStyleBold,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onCancel,
            child: cancelButton != null
                ? Text(
                    cancelButton,
                    style: AppStyles.smallTextStyleBold.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  )
                : Container(),
          ),
          TextButton(
            onPressed: onAccept,
            child: Text(
              acceptButton ?? 'OK',
              style: AppStyles.smallTextStyleBold.copyWith(
                color: AppColors.accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void replace(BuildContext context, Widget child) {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(builder: (context) => child),
    );
  }
}
