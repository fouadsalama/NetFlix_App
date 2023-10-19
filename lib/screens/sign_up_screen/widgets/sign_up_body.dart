import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:netflix_app/cubits/selected_screens/selected_bar_screen_cubit.dart';
import 'package:netflix_app/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:netflix_app/cubits/user_name/user_name_cubit.dart';
import 'package:netflix_app/helper/show_snack_bar.dart';
import '../../../constants/constants.dart';
import '../../sign_in_screen/sign_in_screen.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_failed.dart';
import '../../../widgets/end_text_page.dart';
import '../../../widgets/logo_screens.dart';

class SignUPBody extends StatefulWidget {
  const SignUPBody({super.key});

  @override
  State<SignUPBody> createState() => _SignUPBodyState();
}

class _SignUPBodyState extends State<SignUPBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  String? email;
  String? password;
  String? name;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpSuccess) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return SignInScreen(
              name: name!,
            );
          }));
          context.read<SelectedBarScreenCubit>().onItemToped(0);
          isLoading = false;
        } else if (state is SignUpFailure) {
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
                  CustomTextFailed(
                    hintText: 'Enter your name',
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(height: 26),
                  CustomTextFailed(
                    onChanged: (value) {
                      email = value;
                    },
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 26),
                  CustomTextFailed(
                    hintText: 'Enter your password',
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    text: 'sign up',
                    color: kMainColor,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<SignUpCubit>()
                            .signUpUser(email: email!, password: password!);
                        context.read<UserCubit>().setName(name!);
                        context.read<EmailCubit>().setEmail(email!);
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
                    firstText: 'Already have an account?',
                    text: ' Sign In',
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignInScreen.id);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
