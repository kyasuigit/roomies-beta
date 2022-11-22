import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roomies_beta/providers/house.dart';
import 'package:roomies_beta/screens/houses_screen/create_house_screen.dart';
import 'package:roomies_beta/transitions/sliding_page_route.dart';

import '../../providers/app_user.dart';
import './house_item.dart';

class MyHousesScreen extends StatelessWidget {
  static const routeName = './my_houses';
  const MyHousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    final deviceSize = MediaQuery.of(context).size;
    List<House> listOfHouses = user.getListOfHouses.values.toList();
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EB),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: deviceSize.height * 0.4,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(249, 160, 63, 1),
                    Color.fromARGB(255, 250, 182, 108),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
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
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: SizedBox(
                height: deviceSize.height * 0.34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, right: 12.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                size: 36,
                                color: Color.fromRGBO(249, 160, 63, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: deviceSize.height * 0.02,
                            left: deviceSize.width * 0.08),
                        child: const Text(
                          'My Houses',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gotham',
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: deviceSize.width * 0.08,
                          bottom: deviceSize.height * 0.02,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.home,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              ' ${user.getListOfHouses.length} Homes',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gotham',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: deviceSize.width * 0.80,
                        margin:
                            EdgeInsets.only(bottom: deviceSize.height * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: deviceSize.width * 0.03,
                              ),
                              width: deviceSize.width * 0.80 / 4,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                              width: deviceSize.width * 0.80 / 4,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                left: deviceSize.width * 0.03,
                              ),
                              width: deviceSize.width * 0.80 / 4,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(deviceSize.width * 0.72, 50),
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
                        child: const Text(
                          'Create a House',
                          style: TextStyle(
                            color: Color.fromRGBO(249, 160, 63, 1),
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: deviceSize.height * 0.6,
              child: ListView.builder(
                itemCount: listOfHouses.length,
                itemBuilder: ((context, index) {
                  return HouseItem(
                    houseComponent: listOfHouses[index],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
