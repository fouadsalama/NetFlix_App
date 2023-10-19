import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUpUser({
    required String email,
    required String password,
    String name = '',
  }) async {
    emit(SignUpLoading());

    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

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
