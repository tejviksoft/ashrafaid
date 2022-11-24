import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ashrafulaid/routes/router.gr.dart';
import 'package:ashrafulaid/widgets/colors.dart';

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
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              // ignore: prefer_const_constructors
              BottomNavigationBarItem(
                icon: const Icon(Icons.calculate),
                label: 'Zakat',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.money_rounded),
                label: 'Donate',
              ),
            ],
            selectedItemColor: const Color.fromARGB(223, 124, 12, 169),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
          );
        },
      ),
    );
  }
}
