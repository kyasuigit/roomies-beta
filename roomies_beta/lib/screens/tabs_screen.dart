import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home_screen.dart';
import './chores_screen.dart';
import './chat_screen.dart';
import './money_screen.dart';
import '../providers/app_user.dart';
import 'calendar_screen.dart';
import '../widgets/main_drawer.dart';
import './introduction_screens/introduction_screen.dart';

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
                            const Icon(Icons.location_on),
                            const Text(
                              '38 Beverley',
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {},
                              child: const Icon(
                                Icons.expand_more,
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
