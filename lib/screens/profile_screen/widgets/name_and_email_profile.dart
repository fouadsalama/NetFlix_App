import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/cubits/user_name/user_name_cubit.dart';

class NameAndEmailProfile extends StatelessWidget {
  const NameAndEmailProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userName =
        context.select((UserCubit userNameCubit) => userNameCubit.state);
    final emailUser =
        context.select((EmailCubit emailCubit) => emailCubit.state);
    return SizedBox(
      width: 143,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            emailUser,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff666A71),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
