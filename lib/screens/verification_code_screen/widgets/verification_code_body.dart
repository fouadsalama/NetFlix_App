// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:netflix_app/cubits/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:netflix_app/helper/show_snack_bar.dart';
import 'package:netflix_app/screens/new_password_screen/new_password_screen.dart';
import 'package:netflix_app/widgets/custom_button.dart';
import 'package:netflix_app/screens/verification_code_screen/widgets/pin_code.dart';
import '../../../constants/constants.dart';
import '../../forget_password_screen/widgets/forget_password_body.dart';
import '../../../widgets/logo_screens.dart';

class VerificationCodeBody extends StatefulWidget {
  const VerificationCodeBody({super.key});

  @override
  State<VerificationCodeBody> createState() => _VerificationCodeBodyState();
}

class _VerificationCodeBodyState extends State<VerificationCodeBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController otp = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)?.settings.arguments;
    return BlocProvider(
      create: (context) => VerifyOtpCubit(),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
          listener: (context, state) {
            if (state is VerifyOtpLoading) {
              isLoading = true;
            }
            if (state is VerifyOtpSuccess) {
              Navigator.popAndPushNamed(context, NewPasswordScreen.id,
                  arguments: email);
            }
            if (state is VerifyOtpFailure) {
              showSnackBar(context, state.message);
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
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: ListView(
                  children: [
                    const Logo(),
                    const Text(
                      'Write Code',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Please, enter the code associated\n with your account',
                      style: kTextStye2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    PinCode(otp: otp),
                    const SizedBox(height: 50),
                    CustomButton(
                      text: 'Confirm',
                      color: kMainColor,
                      onTap: () async {
                        await verifyOTP(context, email);
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

  Future<void> verifyOTP(BuildContext context, Object? email) async {
    if (await myAuth.verifyOTP(otp: otp.text) == true) {
      Navigator.pushReplacementNamed(context, NewPasswordScreen.id,
          arguments: email);
    } else {
      showSnackBar(context, 'Invalid OTP');
    }
  }
}
