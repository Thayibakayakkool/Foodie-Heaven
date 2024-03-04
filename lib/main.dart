import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/core/bloc_provider/bloc_provider.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/login_page/forgot_password_page/forgot_password_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/login_page/login_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/signup_page/signup_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/auth/auth_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/bottom_navigation_page/bottom_navigation_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBjL8TJ0BCD_KFGAeJHTK6-F8fYxKS7DMo",
        authDomain: "foodie-heaven-999f3.firebaseapp.com",
        projectId: "foodie-heaven-999f3",
        storageBucket: "foodie-heaven-999f3.appspot.com",
        messagingSenderId: "716016841585",
        appId: "1:716016841585:web:b2bae4c317b0c99ea6bcd0",
        measurementId: "G-451KC049DB",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AllBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors().blackColors,
            useMaterial3: true,
          ),
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthenticatedState) {
                return const BottomNavigationPage();
              } else {
                return const SplashPage();
              }
            },
          ),
          routes: {
            '/signUp': (context) => const SignUpPage(),
            '/forgotPassword': (context) => const ForgotPasswordPage(),
            '/logIn': (context) => const LoginPage(),
          },
        ),
      ),
    );
  }
}
