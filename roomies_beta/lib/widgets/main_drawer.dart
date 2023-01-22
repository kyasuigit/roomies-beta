import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../models/size_config.dart';
import '../screens/houses_screen/my_houses_screen.dart';
import '../screens/tabs_screen.dart';

import '../providers/app_user.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
        slidePercent: 70,
        screenSelectedBuilder: (position, controller) {
          Widget? currentScreen;

          switch (position) {
            case 0:
              currentScreen = const TabsScreen();
              break;
            case 1:
              currentScreen = const MyHousesScreen();
              break;
          }

          return currentScreen as Widget;
        },
        menu: const Menu());
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextStyle unselectedStyle = const TextStyle(
    color: Color(0xFFFFF7EB),
    fontFamily: 'Gotham',
    fontWeight: FontWeight.normal,
  );

  TextStyle selectedStyle = const TextStyle(
    color: Color(0xFFFFF7EB),
    fontFamily: 'Gotham',
    fontWeight: FontWeight.bold,
  );

  Widget defaultMenuTile(String name, IconData leadingIcon, int index,
      VoidCallback clickFunction) {
    return GestureDetector(
      onTap: () {
        clickFunction();
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.02),
        width: SizeConfig.screenWidth * 0.7,
        margin: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (index == selectedIndex)
              Container(
                width: SizeConfig.screenWidth * 0.01,
                height: SizeConfig.blockSizeVertical * 4.2,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF7EB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            SizedBox(width: SizeConfig.screenWidth * 0.02),
            Icon(
              leadingIcon,
              color: const Color(0xFFFFF7EB),
              size: (index == selectedIndex)
                  ? SizeConfig.blockSizeVertical * 4.4
                  : SizeConfig.blockSizeVertical * 3.2,
            ),
            SizedBox(
              width: (index == selectedIndex)
                  ? SizeConfig.screenWidth * 0.03
                  : SizeConfig.screenWidth * 0.02,
            ),
            Material(
              color: Colors.transparent,
              child: AnimatedDefaultTextStyle(
                style: (index == selectedIndex)
                    ? selectedStyle.merge(
                        TextStyle(fontSize: SizeConfig.blockSizeVertical * 3.4))
                    : unselectedStyle.merge(
                        TextStyle(fontSize: SizeConfig.blockSizeVertical * 2.0),
                      ),
                duration: const Duration(milliseconds: 100),
                child: Text(
                  name,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  late SimpleHiddenDrawerController controller;
  int selectedIndex = 0;

  @override
  void didChangeDependencies() {
    controller = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF5766A),
            Color(0xFFF9A03F),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: SizeConfig.screenWidth * 0.7,
            height: SizeConfig.screenHeight,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.02,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color(0xFFFFF7EB),
                        child: Icon(
                          size: SizeConfig.blockSizeVertical * 4,
                          Icons.person,
                          color: const Color(0xFFF5766A),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      Consumer<AppUser>(
                        builder: (_, user, __) => Material(
                          color: Colors.transparent,
                          child: Text(
                            style: TextStyle(
                              color: const Color(0xFFFFF7EB),
                              fontFamily: 'Gotham',
                              fontSize: SizeConfig.blockSizeVertical * 2.8,
                            ),
                            user.getDisplayName,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultMenuTile('Home', Icons.home_rounded, 0, () {
                        controller.setSelectedMenuPosition(0);
                        setState(() {
                          selectedIndex = 0;
                        });
                      }),
                      defaultMenuTile('My House', Icons.people_rounded, 1, () {
                        controller.setSelectedMenuPosition(1);
                        setState(() {
                          selectedIndex = 1;
                        });
                      }),
                      defaultMenuTile('My Profile', Icons.person_rounded, 2,
                          () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      }),
                      defaultMenuTile('Settings', Icons.settings_rounded, 3,
                          () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      }),
                      defaultMenuTile('About', Icons.info_rounded, 4, () {
                        setState(() {
                          selectedIndex = 4;
                        });
                      }),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFFFF7EB),
                          width: 1.5,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.screenHeight * 0.02),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.screenHeight * 0.015,
                        horizontal: SizeConfig.screenWidth * 0.01,
                      ),
                      width: SizeConfig.screenWidth * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.exit_to_app_rounded,
                            color: const Color(0xFFFFF7EB),
                            size: SizeConfig.blockSizeVertical * 3.2,
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.02),
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              "Logout",
                              style: unselectedStyle.merge(
                                TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
