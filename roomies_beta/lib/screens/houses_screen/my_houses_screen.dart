import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:provider/provider.dart';
import 'package:roomies_beta/screens/houses_screen/create_house_screen.dart';
import 'package:roomies_beta/transitions/sliding_page_route.dart';
import 'package:roomies_beta/widgets/home_screen/roommates_widget.dart';

import '../../providers/app_user.dart';
import '../../providers/house.dart';
import '../../models/size_config.dart';

class MyHousesScreen extends StatelessWidget {
  static const routeName = './my_houses';
  const MyHousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color.fromRGBO(249, 160, 63, 1),
      //   foregroundColor: const Color.fromARGB(255, 255, 245, 230),
      //   child: Icon(
      //     Icons.add_rounded,
      //     size: SizeConfig.blockSizeVertical * 4,
      //   ),
      //   onPressed: () {},
      // ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight * 0.005,
                    horizontal: SizeConfig.screenWidth * 0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        } else {
                          SimpleHiddenDrawerController.of(context).toggle();
                        }
                      },
                      icon: Icon(
                        Navigator.of(context).canPop()
                            ? Icons.arrow_back_rounded
                            : Icons.menu_rounded,
                        size: SizeConfig.blockSizeVertical * 3.2,
                        color: const Color(0xFF2F4858),
                      ),
                    ),
                    Text(
                      'My House',
                      style: TextStyle(
                        color: const Color(0xFF2F4858),
                        fontSize: SizeConfig.blockSizeVertical * 2.2,
                        fontFamily: 'Gotham',
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(
                            'Edit House',
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              color: const Color(0xFF2F4858),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          child: Text(
                            'Leave House',
                            style: TextStyle(
                              color: Colors.red.shade500,
                              fontFamily: 'Gotham',
                              fontSize: SizeConfig.blockSizeVertical * 2,
                            ),
                          ),
                        ),
                      ],
                      icon: Icon(
                        Icons.more_vert_rounded,
                        size: SizeConfig.blockSizeVertical * 3.2,
                        color: const Color(0xFF2F4858),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.08),
                height: SizeConfig.screenHeight * 0.18,
                width: SizeConfig.screenWidth * 0.9,
                // decoration: const BoxDecoration(
                //   color: Color.fromRGBO(249, 160, 63, 1),
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(6),
                //   ),
                // ),
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight * 0.025,
                    horizontal: SizeConfig.screenWidth * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Provider.of<House>(context).getHouseName,
                      style: TextStyle(
                        color: const Color(0xFF1A1A1A),
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'Gotham',
                        fontSize: SizeConfig.blockSizeVertical * 4.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: const Color(0xFF1A1A1A),
                          size: SizeConfig.blockSizeVertical * 3.4,
                        ),
                        Text(
                          ' ${Provider.of<House>(context).getUsersIds.length} Roommates',
                          style: TextStyle(
                            color: const Color(0xFF1A1A1A),
                            fontFamily: 'Gotham',
                            fontSize: SizeConfig.blockSizeVertical * 2.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.65,
                width: SizeConfig.screenWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Roommates',
                    //   style: TextStyle(
                    //     fontSize: SizeConfig.blockSizeVertical * 3.2,
                    //     fontWeight: FontWeight.w600,
                    //     fontFamily: 'Gotham',
                    //     color: const Color(0xFF2F4858),
                    //   ),
                    // ),
                    RoommatesWidget()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
