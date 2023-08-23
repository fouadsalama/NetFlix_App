import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../screens/forget_password_screen/widgets/forget_password_body.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit() : super(VerifyOtpInitial());
  Future<void> verifyOTP(context, otp) async {
    emit(VerifyOtpLoading());
    try {
      if (await myAuth.verifyOTP(otp: otp.text) == true) {
        emit(VerifyOtpSuccess());
        // Navigator.pushReplacementNamed(
        //     context, NewPasswordScreen.id,
        //     arguments: email);
      }
    } catch (e) {
      emit(VerifyOtpFailure('Invalid OTP'));
    }
    // showSnackBar(context, 'Invalid OTP');
  }
}
