import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/screens/forget_password_screen/forget_password_screen.dart';
import 'package:netflix_app/screens/home_screen/home_screen.dart';
import 'package:netflix_app/screens/new_password_screen/new_password_screen.dart';
import 'package:netflix_app/screens/page_view_screen/page_view_screen.dart';
import 'package:netflix_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:netflix_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:netflix_app/screens/splash_screen/splash_screen.dart';
import 'package:netflix_app/screens/verification_code_screen/verification_code_screen.dart';
import 'package:netflix_app/screens/welcome_screen/welcome_screen.dart';
import 'package:netflix_app/services/dio_helper.dart';
import 'package:netflix_app/simple_bloc_observer.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  await DioHelper.init();

  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: 'Poppins',
      ),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        PageViewScreen.id: (context) => const PageViewScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        ForgetPasswordScreen.id: (context) => const ForgetPasswordScreen(),
        VerificationCode.id: (context) => const VerificationCode(),
        NewPasswordScreen.id: (context) => const NewPasswordScreen(),
        Home.id: (context) => const Home(),
      },
      initialRoute: Home.id,
    );
  }
}
