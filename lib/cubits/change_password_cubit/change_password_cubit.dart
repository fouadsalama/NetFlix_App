import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  Future<void> changePassword({
    email,
    newPassword,
    confirmPassword,
  }) async {
    emit(ChangePasswordLoading());
    try {
      await auth.sendPasswordResetEmail(email: email);

      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailure('Password can\'t be changed'));
    }
  }
}
