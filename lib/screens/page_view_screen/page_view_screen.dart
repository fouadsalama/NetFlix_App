import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';
import 'widgets/circle_avatar_splash.dart';
import 'widgets/custom_skip_button.dart';
import 'widgets/page_view_item.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});
  static String id = 'Home Page';

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: const [
              PageViewBody(
                image: 'assets/images/dribbble_shot1.png',
                text: 'Enjoy In your TV.',
              ),
              PageViewBody(
                image: 'assets/images/dribbble_shot2.png',
                text: 'Download to watch offline.',
              ),
              PageViewBody(
                image: 'assets/images/dribbble_shot3.png',
                text: 'Watch everywhere',
              ),
            ],
          ),
          const CustomSkipButton(),
          SafeArea(
            child: CircleAvatarSplash(
              index: currentIndex,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
          );

          // Navigator.pushNamed(context, SplashScreen.id);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
