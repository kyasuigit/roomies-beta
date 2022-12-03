import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:roomies_beta/transitions/sliding_page_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/size_config.dart';
import './home_screen.dart';
import './chores_screen.dart';
import './chat_screen.dart';
import './money_screen.dart';
import '../providers/app_user.dart';
import 'calendar_screen.dart';
import '../widgets/main_drawer.dart';
import './introduction_screens/introduction_screen.dart';
import './houses_screen/my_houses_screen.dart';
import '../providers/house.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const ChoresScreen(),
    const ChatScreen(),
    const MoneyScreen(),
    const CalendarScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() => _selectedPageIndex = index);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _getDatabaseUserdata();
      },
    );
  }

  _getDatabaseUserdata() {
    final user = Provider.of<AppUser>(context, listen: false);
    user.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return user.isFirstTimeUser
        ? const IntroductionScreen()
        : Scaffold(
            backgroundColor: const Color(0xFFFFF7EB),
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 24,
              onTap: _selectPage,
              backgroundColor: const Color.fromARGB(255, 249, 159, 63),
              unselectedItemColor: const Color(0xFFFFF7EB),
              selectedItemColor: const Color(0xFFFFF7EB),
              currentIndex: _selectedPageIndex,
              showUnselectedLabels: false,
              selectedFontSize: 13,
              unselectedFontSize: 13,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Gotham',
              ),
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
              ),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded),
                  label: 'Chores',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.money_rounded),
                  label: 'Money',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_rounded),
                  label: 'Calendar',
                ),
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            Provider.of<House>(context).getHouseName,
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.4,
                              fontFamily: 'Gotham',
                              color: _selectedPageIndex == 0
                                  ? const Color(0xFF2F4858)
                                  : const Color(0xFFF9A03F),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 3.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                Navigator.of(context).push(
                                  SlidingPageRoute(
                                      child: const MyHousesScreen(),
                                      route: MyHousesScreen.routeName),
                                );
                              },
                              child: Icon(
                                Icons.expand_more_rounded,
                                color: _selectedPageIndex == 0
                                    ? const Color(0xFF2F4858)
                                    : const Color(0xFFF9A03F),
                              ),
                            ),
                          ),
                        ],
                      ),
                      centerTitle: true,
                      backgroundColor: _selectedPageIndex == 0
                          ? const Color.fromRGBO(249, 160, 63, 1)
                          : Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        onPressed: () {
                          SimpleHiddenDrawerController.of(context).toggle();
                        },
                        icon: Icon(
                          Icons.menu_rounded,
                          color: _selectedPageIndex == 0
                              ? const Color(0xFF2F4858)
                              : const Color(0xFFF9A03F),
                        ),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_none,
                            color: _selectedPageIndex == 0
                                ? const Color(0xFF2F4858)
                                : const Color(0xFFF9A03F),
                          ),
                        ),
                      ],
                    ),
                  ]),
              body: _pages[_selectedPageIndex],
            ),
          );
  }
}
