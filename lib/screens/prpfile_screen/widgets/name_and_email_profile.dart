import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class NameAndEmailProfile extends StatelessWidget {
  const NameAndEmailProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 143,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fouad Salama',
            style: TextStyle(
                fontSize: 18, color: kSecondColor, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            'fouadSalama39@gmail.com',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
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
