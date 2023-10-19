import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  Future<void> signInUser(
      {required String email, required String password}) async {
    emit(SignInLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure(message: 'user not found'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure(message: 'wrong password'));
      }
    } catch (e) {
      emit(SignInFailure(message: 'something went wrong pleas try again'));
    }
  }
}
