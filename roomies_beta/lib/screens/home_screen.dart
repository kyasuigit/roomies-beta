import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home_screen/overview_widget.dart';
import '../widgets/home_screen/roommates_widget.dart';
import '../providers/app_user.dart';
import '../providers/house.dart';
import '../widgets/home_screen/ad_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool taskIsMinimized = false;
  bool roommatesIsMinimized = false;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
              child: Text(
                "Good ${DateTime.now().hour < 12 ? 'Morning' : DateTime.now().hour < 17 ? 'Afternoon' : 'Evening'}, \n${user.getDisplayName}",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gotham',
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            const AdCard(), // AD
            const SizedBox(height: 15),

            const OverviewWidget(), // OVERVIEW SECTION

            const SizedBox(height: 15),

            const RoommatesWidget(), // ROOMMATES SECTION
            const SizedBox(height: 400),
          ],
        ),
      ),
    );
  }
}
