import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/string.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/widgets/button_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/widgets/reusable_text_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/widgets/text_form_field_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/credential/credential_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors().transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors().amber,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: reusableTextWidget(AppStrings.resetPassword),
            ),
            kSizedBox15,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                'Enter your email and we will send you a password reset link',
                style: textStyle(AppColors().amber, 19),
                textAlign: TextAlign.center,
              ),
            ),
            kSizedBox10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textFormFieldWidget(
                AppStrings.email,
                AppStrings.email,
                false,
                _emailController,
                prefix: Icon(
                  Icons.email,
                  color: AppColors().amber,
                ),
              ),
            ),
            kSizedBox10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buttonWidget(
                () {
                  if (_emailController.text.isEmpty) {
                    Utils().flutterToast('Enter your email');
                    return;
                  }
                  BlocProvider.of<CredentialBloc>(context)
                      .add(ForgotPasswordEvent(email: _emailController.text));
                  Utils().showSnackBar(
                      context: context,
                      content: 'Password reset link sent! Check your email');
                },
                AppStrings.resetPassword,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
