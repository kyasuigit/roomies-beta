import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomies_beta/transitions/sliding_page_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 24,
              onTap: _selectPage,
              backgroundColor: Colors.white,
              unselectedItemColor: Theme.of(context).colorScheme.primary,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              currentIndex: _selectedPageIndex,
              showUnselectedLabels: true,
              selectedFontSize: 13,
              unselectedFontSize: 13,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.clean_hands),
                  label: 'Chores',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.money),
                  label: 'Money',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'Calendar',
                ),
              ],
            ),
            drawer: const Drawer(
              child: MainDrawer(),
            ),
            body: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              Provider.of<House>(context).getHouseName,
                              style: const TextStyle(fontSize: 18),
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
                                child: const Icon(
                                  Icons.expand_more,
                                ),
                              ),
                            ),
                          ],
                        ),
                        centerTitle: true,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications_none),
                          ),
                        ],
                      ),
                    ]),
                body: _pages[_selectedPageIndex],
              ),
            ),
          );
  }
}
