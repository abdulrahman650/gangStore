
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../cart_tab/cart_tab.dart';
import '../favorite_tab/favorite_tab.dart';
import '../home/home_tab.dart';
import '../profile_tab/profile_screen.dart';
import '../profile_tab/profile_tab.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with TickerProviderStateMixin {
  late PageController controller;
  late List<AnimationController> iconControllers;
  late List<Widget> screen;
  int currentScreen = 0;

  @override
  void initState() {
    super.initState();
    screen = [HomeTab(), cartTab(), favoriteTab(), ProfileScreen()];
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              currentScreen = index;
            });
          },
          children: screen,
        ),

        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withValues(alpha: .7),
            currentIndex: currentScreen,
            onTap: (index) {
              setState(() {
                currentScreen = index;
              });
              controller.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home, size: 20),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart, size: 20),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: 20),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled, size: 20),
                label: "Profile",
              ),
            ],
          ),
        ),)
      );
  }
}


