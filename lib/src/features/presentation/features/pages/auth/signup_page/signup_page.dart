import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/string.dart';
import 'package:foodie_heaven/src/core/routes/routes_name.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/domain/entities/user_entity.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/signup_page/widgets/phoneno_text_field_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/signup_page/widgets/rich_text_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/widgets/button_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/widgets/reusable_text_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/widgets/text_form_field_widget.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/auth/auth_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/credential/credential_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/bottom_navigation_page/bottom_navigation_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AppColors appColors = AppColors();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  bool isShowPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kSizedBox30,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100.w),
            child: reusableTextWidget(AppStrings.signup),
          ),
          kSizedBox45,
          textFormFieldWidget(
            AppStrings.name,
            'Enter your name',
            false,
            nameController,
            prefix: Icon(
              Icons.person,
              color: appColors.amber,
            ),
          ),
          kSizedBox25,
          textFormFieldWidget(
            AppStrings.address,
            'Enter your address',
            false,
            addressController,
            prefix: Icon(
              Icons.location_on,
              color: appColors.amber,
            ),
          ),
          kSizedBox25,
          textFormFieldWidget(
            AppStrings.email,
            'Enter your email',
            false,
            emailController,
            prefix: Icon(
              Icons.email,
              color: appColors.amber,
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
          kSizedBox25,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: phoneNoTextFieldWidget(
              phoneNoController,
            ),
          ),

          kSizedBox25,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: buttonWidget(
              () {
                _signUp();
              },
              AppStrings.signup,
            ),
          ),
          kSizedBox20,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  loginPage,
                );
              },
              child: richTextWidget(),
            ),
          ),
        ],
      ),
    );
  }

  void _signUp() {
    if (nameController.text.isEmpty) {
      Utils().flutterToast('Enter your name');
      return;
    }
    if (emailController.text.isEmpty) {
      Utils().flutterToast('Enter your email');
      return;
    }
    if (passwordController.text.isEmpty) {
      Utils().flutterToast('Enter your password');
      return;
    }
    if (addressController.text.isEmpty) {
      Utils().flutterToast('Enter your address');
      return;
    }
    if (phoneNoController.text.isEmpty) {
      Utils().flutterToast('Enter your phoneNo');
      return;
    }
    return BlocProvider.of<CredentialBloc>(context).add(
      SignUpEvent(
        userEntity: UserEntity(
          name: nameController.text,
          address: addressController.text,
          password: passwordController.text,
          phoneNo: phoneNoController.text,
          email: emailController.text,
        ),
      ),
    );
  }
}
