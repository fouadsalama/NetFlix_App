import 'package:flutter/material.dart';
import 'package:netflix_app/screens/favorite_screen/widgets/custom_favorite_item.dart';
import '../../../constants/constants.dart';

class ContainerItem extends StatelessWidget {
  const ContainerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 219,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black38,
                BlendMode.hardLight,
              ),
              image: AssetImage('assets/images/Rectangle 22.png'),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.delete,
            color: Color(0xffFFFFFF),
            // size: 20,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 183, left: 21, right: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFavoriteItem(
                image: 'assets/images/chevron.png',
                text: 'Download',
              ),
              CustomFavoriteItem(
                image: 'assets/images/play.png',
                text: 'Play',
              ),
              Icon(
                Icons.favorite,
                color: kMainColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
