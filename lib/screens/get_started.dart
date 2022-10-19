import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_news_2/cubit/login_cubit/login_cubit.dart';
import 'package:tech_news_2/screens/home_page.dart';
import 'package:tech_news_2/utils/app_colors.dart';
import 'package:tech_news_2/utils/app_extras.dart';
import 'package:tech_news_2/utils/app_images.dart';
import 'package:tech_news_2/utils/app_strings.dart';
import 'package:tech_news_2/utils/app_styles.dart';
import 'package:tech_news_2/widgets/custom_button.dart';
import 'package:tech_news_2/widgets/progress_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.accentColor,
        body: Container(
          margin: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 128),
              Image.asset(
                AppImages.getStartedVector,
                width: AppExtras.getDeviceWidth(context) * 0.8,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 32),
              Text(
                AppStrings.getStartedTitle,
                style: AppStyles.headingStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              Text(
                AppStrings.getStartedDescription,
                style: AppStyles.contentStyle,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          AppExtras.showAlertDialog(
            context: context,
            title: AppStrings.error,
            description: state.error,
            onCancel: () {},
            onAccept: () {
              AppExtras.pop(context);
            },
            acceptButton: AppStrings.okButton,
          );
        }
        if (state is LoginSuccess) {
          AppExtras.replace(context, const HomePage());
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return ProgressButton(
            color: AppColors.whiteColor,
            progressColor: AppColors.primaryColor,
          );
        }
        return CustomButton(
          onTap: () async {
            await loginCubit.signInAnonymously();
          },
          text: AppStrings.getStarted,
          color: AppColors.whiteColor,
          fontColor: AppColors.primaryColor,
        );
      },
    );
  }
}
