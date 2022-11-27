import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomies_beta/screens/houses_screen/create_house_screen.dart';
import 'package:roomies_beta/transitions/sliding_page_route.dart';

import '../../providers/house.dart';
import '../../models/size_config.dart';

class MyHousesScreen extends StatelessWidget {
  static const routeName = './my_houses';
  const MyHousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFF7EB),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: SizeConfig.screenHeight * 0.4,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 160, 63, 1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: SizeConfig.blockSizeVertical * 3.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: SizeConfig.screenHeight * 0.02,
                      ),
                      child: Text(
                        Provider.of<House>(context).getHouseName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gotham',
                          fontSize: SizeConfig.blockSizeVertical * 5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: SizeConfig.screenHeight * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: SizeConfig.blockSizeVertical * 2.4,
                          ),
                          Text(
                            ' ${Provider.of<House>(context).getUsers.length} Roommates',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Gotham',
                              fontSize: SizeConfig.blockSizeVertical * 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.80,
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.screenHeight * 0.025),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: SizeConfig.screenWidth * 0.03,
                            ),
                            width: SizeConfig.screenWidth * 0.2,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 2.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.money,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  '31%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Gotham',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.80 / 4,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 2.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.clean_hands,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  '72%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Gotham',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.03,
                            ),
                            width: SizeConfig.screenWidth * 0.80 / 4,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 2.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: Colors.white, width: 2.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.set_meal,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  '55%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Gotham',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(SizeConfig.screenWidth * 0.72, 0),
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight * 0.016,
                            horizontal: SizeConfig.screenWidth * 0.02,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shadowColor: MaterialStateProperty.all(Colors.grey),
                        elevation: MaterialStateProperty.all(2),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          SlidingPageRoute(
                            child: const CreateHouseScreen(),
                            route: CreateHouseScreen.routeName,
                          ),
                        );
                      },
                      child: Text(
                        'Create a House',
                        style: TextStyle(
                          color: const Color.fromRGBO(249, 160, 63, 1),
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeVertical * 2.2,
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
    );
  }
}
