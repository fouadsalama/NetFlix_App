import 'package:bloc/bloc.dart';

class SelectedBarScreenCubit extends Cubit<int> {
  SelectedBarScreenCubit() : super(0);

  void onItemToped(int index) {
    emit(index);
  }
}
