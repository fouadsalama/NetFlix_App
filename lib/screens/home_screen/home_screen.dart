import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/screens/favorite_screen/favorite_screen.dart';
import 'package:netflix_app/screens/profile_screen/person_screen.dart';
import 'package:netflix_app/screens/search_screen/search_screen.dart';
import 'widgets/home_body_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static String id = 'Home_Screen';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeBodyScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  void onItemToped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        width: double.infinity,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBackgroundColor.withOpacity(0.9),
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  'assets/images/home.png',
                  color: selectedIndex == 0 ? kMainColor : kSecondColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  'assets/images/search.png',
                  color: selectedIndex == 1 ? kMainColor : kSecondColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(
                  'assets/images/love.png',
                  color: selectedIndex == 2 ? kMainColor : kSecondColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(
                  'assets/images/user.png',
                  color: selectedIndex == 3 ? kMainColor : kSecondColor,
                ),
              ),
              label: '',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemToped,
        ),
      ),
    );
  }
}
