import 'package:flutter/material.dart';

import './dish_track_screen.dart';
import './grocery_track_screen.dart';
import './fridge_track_screen.dart';
import './report_system_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
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
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.flatware),
            label: 'DishTrack',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'FridgeTrack',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'GroceryTrack',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Report',
          ),
        ],
      ),
    );
  }
}
