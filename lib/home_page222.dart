import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ashrafulaid/routes/router.gr.dart';
import 'package:ashrafulaid/widgets/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        backgroundColor: AppColor.kBackgroundColor,
        routes: const [
          PostsRouter(),
          ZakatMainRouter(),
          DonationsRouter(),
        ],
        // endDrawer: const DrawerWidget(),
        bottomNavigationBuilder: (_, tabsRouter) {
          return SalomonBottomBar(
            curve: Curves.easeIn,
            selectedItemColor: Colors.green,
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              // vertical: 40,
            ),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              SalomonBottomBarItem(
                selectedColor: Colors.green.shade500,
                icon: const Icon(
                  Icons.calculate,
                  size: 30,
                ),
                title: const Text('Zakat'),
              ),
              SalomonBottomBarItem(
                selectedColor: Colors.green.shade400,
                icon: const Icon(
                  Icons.money_rounded,
                  size: 30,
                ),
                title: const Text('Donation'),
              ),
            ],
          );
        },
      ),
    );
  }
}
