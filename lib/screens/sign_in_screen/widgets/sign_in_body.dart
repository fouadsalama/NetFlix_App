import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:netflix_app/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:netflix_app/screens/home_screen/home_screen.dart';
import 'package:netflix_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:netflix_app/widgets/custom_button.dart';
import 'package:netflix_app/widgets/end_text_page.dart';
import 'package:netflix_app/widgets/logo_screens.dart';
import 'package:netflix_app/screens/sign_in_screen/widgets/remember_me_.dart';
import '../../../constants/constants.dart';
import '../../../helper/show_snack_bar.dart';
import '../../../widgets/custom_text_failed.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({
    super.key,
  });

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool isLoading = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          isLoading = true;
        } else if (state is SignInSuccess) {
          Navigator.pushNamed(context, Home.id).then((value) {
            mail.clear();
            pass.clear();
          });
          isLoading = false;
        } else if (state is SignInFailure) {
          showSnackBar(context, state.message);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: const CircularProgressIndicator(
            color: kMainColor,
          ),
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: Padding(
              padding: EdgeInsets.only(
                left: 26,
                right: 26,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ListView(
                children: [
                  const Logo(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFailed(
                    hintText: 'Enter your email',
                    controller: mail,
                    onChanged: (value) {
                      email = value;
                    },
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 25),
                  CustomTextFailed(
                    hintText: 'Enter your password',
                    controller: pass,
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  const RememberMe(),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: 'Sign In',
                    color: kMainColor,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SignInCubit>(context)
                            .signInUser(email: email!, password: password!);
                      } else {
                        setState(() {});
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextEndPage(
                    firstText: 'Don\'t have an account?',
                    text: '  Sign Up',
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
