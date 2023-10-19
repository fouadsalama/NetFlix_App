// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:netflix_app/cubits/change_password_cubit/change_password_cubit.dart';
import 'package:netflix_app/helper/show_snack_bar.dart';
import '../../../constants/constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_failed.dart';
import '../../../widgets/logo_screens.dart';
import 'package:email_otp/email_otp.dart';

EmailOTP myAuth = EmailOTP();

class ForgetPasswordBogy extends StatefulWidget {
  const ForgetPasswordBogy({super.key});

  @override
  State<ForgetPasswordBogy> createState() => _ForgetPasswordBogyState();
}

class _ForgetPasswordBogyState extends State<ForgetPasswordBogy> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? emailAddress;

  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController email = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordLoading) {
              isLoading = true;
            }
            if (state is ChangePasswordSuccess) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text(
                        'please Check Your Email To Reset Password and back TO Sign in again ',
                        textAlign: TextAlign.center,
                      ),
                    );
                  });
              email.clear();

              isLoading = false;
            }
            if (state is ChangePasswordFailure) {
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
              child: Padding(
                padding: EdgeInsets.only(
                    left: 26,
                    right: 26,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ListView(
                  children: [
                    const Logo(),
                    const Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please, enter the address associated\n with your account ',
                      style: kTextStye2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    CustomTextFailed(
                      controller: email,
                      onChanged: (value) {
                        emailAddress = value;
                      },
                      hintText: 'Enter your email',
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      color: kMainColor,
                      text: 'Reset Password',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<ChangePasswordCubit>(context)
                              .changePassword(email: emailAddress);
                        } else {
                          setState(() {});
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
