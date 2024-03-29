import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/cubits/sign_in_cubit/sign_in_cubit.dart';
import '../../widgets/background_image.dart';
import 'widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
  });
  static String id = 'Sign In';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: const Stack(
        children: [
          BackgroundImage(
            image: 'assets/images/sign in.png',
          ),
          Scaffold(
            backgroundColor: Colors.black54,
            body: SignInBody(),
          ),
        ],
      ),
    );
  }
}
