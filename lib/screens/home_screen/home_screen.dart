import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/cubits/selected_screens/selected_bar_screen_cubit.dart';
import 'package:netflix_app/screens/favorite_screen/favorite_screen.dart';
import 'package:netflix_app/screens/profile_screen/person_screen.dart';
import 'package:netflix_app/screens/search_screen/search_screen.dart';
import 'widgets/home_body_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  static String id = 'Home_Screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedBarScreenCubit, int>(
      builder: (context, selectedIndex) {
        return WillPopScope(
          onWillPop: () async {
            if (selectedIndex != 0) {
              context.read<SelectedBarScreenCubit>().onItemToped(0);
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: IndexedStack(
              index: selectedIndex,
              children: const [
                HomeBodyScreen(),
                SearchScreen(),
                FavoriteScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              width: double.infinity,
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                currentIndex: selectedIndex,
                onTap: (index) {
                  context.read<SelectedBarScreenCubit>().onItemToped(index);
                },
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: selectedIndex == 0
                          ? Image.asset(
                              'assets/images/home2.png',
                              color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .selectedItemColor,
                            )
                          : Image.asset(
                              'assets/images/home.png',
                              color: Theme.of(context).unselectedWidgetColor,
                            ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: selectedIndex == 1
                          ? Image.asset(
                              'assets/images/search2.png',
                              color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .selectedItemColor,
                            )
                          : Image.asset(
                              'assets/images/search.png',
                              color: Theme.of(context).unselectedWidgetColor,
                            ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 24,
                      width: 24,
                      child: selectedIndex == 2
                          ? Image.asset(
                              'assets/images/heart2.png',
                              color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .selectedItemColor,
                            )
                          : Image.asset(
                              'assets/images/love.png',
                              color: Theme.of(context).unselectedWidgetColor,
                            ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 24,
                      width: 24,
                      child: selectedIndex == 3
                          ? Image.asset(
                              'assets/images/user2.png',
                              color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .selectedItemColor,
                            )
                          : Image.asset(
                              'assets/images/user.png',
                              color: Theme.of(context).unselectedWidgetColor,
                            ),
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
