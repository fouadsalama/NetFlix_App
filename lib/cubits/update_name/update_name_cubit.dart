import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'update_name_state.dart';

final email = FirebaseAuth.instance.currentUser?.email;

class UpdateNameCubit extends Cubit<String> {
  UpdateNameCubit() : super('');

  void updateName(String newName) {
    emit(newName);
  }
}
