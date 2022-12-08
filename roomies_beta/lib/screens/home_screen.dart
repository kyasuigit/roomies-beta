import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home_screen/roommates_widget.dart';
import '../providers/app_user.dart';
import '../providers/house.dart';
import '../models/size_config.dart';
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

  Widget buildOverviewCard(String title, IconData overviewIcon, String subtitle,
      Color color1, Color color2) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: SizeConfig.screenWidth * 0.44,
        height: SizeConfig.screenHeight * 0.15,
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight * 0.02,
          horizontal: SizeConfig.screenWidth * 0.03,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.2),
          //     spreadRadius: 2,
          //     blurRadius: 8,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFFFFF7EB),
                    fontSize: SizeConfig.blockSizeVertical * 2.4,
                    fontFamily: 'Gotham',
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.007),
                Icon(
                  overviewIcon,
                  color: const Color(0xFFFFF7EB),
                  size: SizeConfig.blockSizeVertical * 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final user = Provider.of<AppUser>(context);
    return SingleChildScrollView(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: SizeConfig.screenHeight * 0.4,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 249, 159, 63),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.02),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02,
                      vertical: SizeConfig.screenHeight * 0.005),
                  child: Text(
                    "Good ${DateTime.now().hour < 12 ? 'Morning' : DateTime.now().hour < 17 ? 'Afternoon' : 'Evening'}, \n${user.getDisplayName}",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 4,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gotham',
                      color: const Color(0xFF2F4858),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.4,
                  child: Center(
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.screenHeight * 0.02),
                      shrinkWrap: true,
                      primary: true,
                      mainAxisSpacing: 0,
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        buildOverviewCard(
                          "Chores",
                          Icons.cleaning_services_rounded,
                          "Test",
                          Colors.deepPurple.shade400,
                          Colors.deepPurple.shade200,
                        ),
                        buildOverviewCard(
                          "Messaging",
                          Icons.message_rounded,
                          "Test",
                          Colors.pink.shade400,
                          Colors.pink.shade200,
                        ),
                        buildOverviewCard(
                          "Money",
                          Icons.money_rounded,
                          "Test",
                          Colors.cyan.shade400,
                          Colors.cyan.shade100,
                        ),
                        buildOverviewCard(
                          "Events",
                          Icons.calendar_month_rounded,
                          "Test",
                          Colors.lightGreen.shade400,
                          Colors.lightGreen.shade100,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const AdCard(), // AD

                const SizedBox(height: 15),

                const RoommatesWidget(), // ROOMMATES SECTION
                const SizedBox(height: 400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
