import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants/constants.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
    required this.otp,
  });

  final TextEditingController otp;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: otp,
      length: 6,
      appContext: context,
      autoFocus: true,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 55,
        fieldWidth: 40,
        activeFillColor: Colors.black,
        inactiveColor: kSecondColor,
        selectedColor: kMainColor,
        activeColor: kSecondColor,
      ),
      textStyle: const TextStyle(
        color: kSecondColor,
      ),
    );
  }
}
