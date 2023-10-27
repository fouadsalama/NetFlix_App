import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/cubits/update_name/update_name_cubit.dart';

class NameAndEmailProfile extends StatelessWidget {
  const NameAndEmailProfile({
    super.key,
    required this.name,
    required this.email,
  });
  final String name, email;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateNameCubit, String>(
      builder: (context, state) {
        return SizedBox(
          width: 143,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.isEmpty ? name : state,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Text(
                email,
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
      },
    );
  }
}
