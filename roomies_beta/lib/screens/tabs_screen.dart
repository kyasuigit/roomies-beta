import 'package:flutter/material.dart';

import './home_screen.dart';
import './dish_track_screen.dart';
import './grocery_track_screen.dart';
import './fridge_track_screen.dart';
import './report_system_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const DishTrackScreen(),
    const GroceryTrackScreen(),
    const FridgeTrackScreen(),
    const ReportSystemScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() => _selectedPageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '38 Beverley',
              style: TextStyle(fontSize: 18),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
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
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex],
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flatware),
            label: 'DishTrack',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'GroceryTrack',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
