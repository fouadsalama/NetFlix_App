import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:netflix_app/cubits/change_password_cubit/change_password_cubit.dart';
import 'package:netflix_app/helper/show_snack_bar.dart';
import 'package:netflix_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:netflix_app/widgets/custom_button.dart';
import '../../../constants/constants.dart';
import '../../../widgets/custom_text_failed.dart';
import '../../../widgets/logo_screens.dart';

class NewPasswordBody extends StatefulWidget {
  const NewPasswordBody({super.key});

  @override
  State<NewPasswordBody> createState() => _NewPasswordBodyState();
}

class _NewPasswordBodyState extends State<NewPasswordBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)?.settings.arguments;
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
              Navigator.pushNamed(context, SignInScreen.id);
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
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: ListView(
                  children: [
                    const Logo(),
                    CustomTextFailed(
                      controller: newPasswordController,
                      hintText: 'New Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFailed(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      text: 'Sign In',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<ChangePasswordCubit>(context)
                              .changePassword(
                            email: email,
                            newPassword: newPasswordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                          // print('change password success');
                        } else {
                          setState(() {});
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      color: kMainColor,
                    ),
                    const SizedBox(height: 30),
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
