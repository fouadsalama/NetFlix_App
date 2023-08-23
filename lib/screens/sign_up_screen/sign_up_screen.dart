import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/cubits/sign_up_cubit/sign_up_cubit.dart';

import '../../widgets/background_image.dart';

import 'widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static String id = 'Sign Up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const Stack(
        children: [
          BackgroundImage(
            image: 'assets/images/2.png',
          ),
          Scaffold(
            backgroundColor: Colors.black54,
            body: SignUPBody(),
          ),
        ],
      ),
    );
  }
}
