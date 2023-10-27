import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/constants.dart';
import '../../../../cubits/update_name/update_name_cubit.dart';
import '../../../../services/save_and_load_data.dart';
import '../../../../widgets/custom_button.dart';

class EditBottomSheet extends StatelessWidget {
  const EditBottomSheet({
    super.key,
    required this.name,
    required this.email,
  });
  final String name, email;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return BlocBuilder<UpdateNameCubit, String>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter Your Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  onSubmitted: (value) {
                    nameController.text = value;
                    saveData(name: value, email: email);
                    context
                        .read<UpdateNameCubit>()
                        .updateName(value.isEmpty ? name : value);
                    Navigator.pop(context);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  cursorColor: Theme.of(context).highlightColor,
                  decoration: InputDecoration(
                    hintText: state.isEmpty ? name : state,
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).hintColor),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Save',
                  color: kMainColor,
                  onTap: () async {
                    final newName = nameController.text.isEmpty
                        ? name
                        : nameController.text;

                    try {
                      saveData(name: newName, email: email);
                      context.read<UpdateNameCubit>().updateName(newName);

                      Navigator.pop(context);
                    } catch (e) {
                      throw Exception('$e');
                    }
                  },
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
    );
  }
}
