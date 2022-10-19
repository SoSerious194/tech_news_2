import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_news_2/utils/app_colors.dart';
import 'package:tech_news_2/utils/app_strings.dart';
import 'package:tech_news_2/utils/app_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              FaIcon(
                FontAwesomeIcons.circleHalfStroke,
                color: AppColors.whiteColor,
              ),
              Text(
                AppStrings.theme,
                style: AppStyles.mediumTextStyleBold,
              ),
              const SwitchButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (value) {},
      value: false,
      activeColor: AppColors.accentColor,
    );
  }
}
