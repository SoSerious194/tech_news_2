import 'package:flutter/material.dart';
import 'package:tech_news_2/utils/app_colors.dart';
import 'package:tech_news_2/utils/app_methods.dart';
import 'package:tech_news_2/utils/app_strings.dart';
import 'package:tech_news_2/utils/app_styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            ListTile(
              onTap: () async =>
                  await AppMethods.openUrl(AppStrings.privacyPolicy),
              title: Text(
                AppStrings.privacyPolicy,
                style: AppStyles.mediumTextStyleBold,
              ),
              subtitle: Text(
                AppStrings.tapPrivacy,
                style: AppStyles.smallTextStyle,
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              onTap: () async =>
                  await AppMethods.openUrl(AppStrings.publisherInfoUrl),
              title: Text(
                AppStrings.publisherInfo,
                style: AppStyles.mediumTextStyleBold,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.publisherDescription,
                    style: AppStyles.smallTextStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.tapPublisher,
                    style: AppStyles.smallTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              onTap: () async =>
                  await AppMethods.openUrl(AppStrings.contactUrl),
              title: Text(
                AppStrings.contactInfo,
                style: AppStyles.mediumTextStyleBold,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.tapContactInfo,
                    style: AppStyles.smallTextStyle,
                  ),
                  Text(
                    AppStrings.furtherContactLink,
                    style: AppStyles.smallTextStyle.copyWith(
                      color: AppColors.accentColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
