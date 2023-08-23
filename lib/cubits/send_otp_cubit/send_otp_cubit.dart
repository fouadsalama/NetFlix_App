import 'package:bloc/bloc.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../screens/forget_password_screen/widgets/forget_password_body.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  SendOtpCubit() : super(SendOtpInitial());
  Future<void> sendOTP(context, email) async {
    emit(SendOtpLoading());
    try {
      myAuth.setConfig(
        appEmail: "me@rohitchouhan.com",
        appName: "Email OTP",
        userEmail: email.text,
        otpLength: 6,
        otpType: OTPType.digitsOnly,
      );
      if (await myAuth.sendOTP() == true) {
        emit(SendOtpSuccess());
      }
    } catch (e) {
      emit(SendOtpFailure('Oops, OTP send failed'));
    }
    // showSnackBar(context, 'Oops, OTP send failed');
  }
}
