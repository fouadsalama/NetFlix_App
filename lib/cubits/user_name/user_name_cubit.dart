import 'package:bloc/bloc.dart';

class UserCubit extends Cubit<String> {
  UserCubit() : super('');

  void setName(String name) {
    emit(name);
  }
}

class EmailCubit extends Cubit<String> {
  EmailCubit() : super('');

  void setEmail(String name) {
    emit(name);
  }
}
