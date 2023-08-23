import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  BuildContext? get context => null;

  Future<void> signUpUser(
      {required String email, required String password}) async {
    emit(SignUpLoading());

    try {
      // ignore: unused_local_variable
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(SignUpFailure(message: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SignUpFailure(message: 'email already exists'));
      }
    } catch (e) {
      emit(SignUpFailure(message: 'there was an error please try again '));
    }
  }
}
