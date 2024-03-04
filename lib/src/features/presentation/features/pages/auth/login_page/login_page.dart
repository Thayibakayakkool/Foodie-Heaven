import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/string.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/domain/entities/user_entity.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/login_page/widget/forgot_password_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/login_page/widget/social_media_button_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/widgets/button_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/widgets/reusable_text_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/widgets/text_form_field_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/auth/auth_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/credential/credential_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/bottom_navigation_page/bottom_navigation_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppColors appColors = AppColors();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColors.blackColors,
        body: BlocConsumer<CredentialBloc, CredentialState>(
          listener: (context, state) {
            if (state is CredentialLoaded) {
              BlocProvider.of<AuthBloc>(context).add(LoggedInEvent());
            }
            if (state is CredentialError) {
              Utils().flutterToast(state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is CredentialLoading) {
              return Utils().loadingWidget();
            }
            if (state is CredentialLoaded) {
              return BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthenticatedState) {
                    return const BottomNavigationPage();
                  } else {
                    return _bodyWidget();
                  }
                },
              );
            }
            return _bodyWidget();
          },
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          kSizedBox30,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 125.w),
            child: reusableTextWidget(AppStrings.login),
          ),
          kSizedBox45,
          textFormFieldWidget(
            AppStrings.email,
            'Enter your email',
            false,
            emailController,
            prefix: Icon(
              Icons.email,
              color: AppColors().amber,
            ),
          ),
          kSizedBox25,
          textFormFieldWidget(
            AppStrings.password,
            'Enter your password',
            isShowPassword,
            passwordController,
            prefix: Icon(
              Icons.lock,
              color: appColors.amber,
            ),
            suffix: IconButton(
              onPressed: () {
                setState(() {
                  isShowPassword = !isShowPassword;
                });
              },
              icon: isShowPassword
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              color: appColors.amber,
            ),
          ),
          kSizedBox20,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/forgotPassword',
                );
              },
              child: forgotPasswordWidget(),
            ),
          ),
          kSizedBox20,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: buttonWidget(
              () {
                _logIn();
              },
              AppStrings.login,
            ),
          ),
          kSizedBox15,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 165.w),
            child: Text(
              AppStrings.or,
              style: textStyle(
                appColors.amber,
                14.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w),
            child: socialMediaWidget(
              () {
                BlocProvider.of<CredentialBloc>(context)
                    .add(GoogleSignInEvent());
              },
            ),
          ),
          kSizedBox15,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: buttonWidget(
              () {
                Navigator.pushNamed(
                  context,
                  '/signUp',
                );
              },
              AppStrings.signup,
            ),
          ),
        ],
      ),
    );
  }

  void _logIn() {
    if (emailController.text.isEmpty) {
      Utils().flutterToast('Enter your email');
      return;
    }
    if (passwordController.text.isEmpty) {
      Utils().flutterToast('Enter your password');
      return;
    }
    return BlocProvider.of<CredentialBloc>(context).add(
      LogInEvent(
        userEntity: UserEntity(
          email: emailController.text,
          password: passwordController.text,
        ),
      ),
    );
  }
}
