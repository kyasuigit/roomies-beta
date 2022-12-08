import 'package:flutter/material.dart';

import '../../models/size_config.dart';
import '../../providers/app_user.dart';

class RoommateTile extends StatelessWidget {
  final AppUser roommate;

  const RoommateTile({super.key, required this.roommate});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: SizeConfig.screenHeight * 0.03,
      ),
      child: ListTile(
        tileColor: const Color.fromRGBO(249, 160, 63, 1),
        contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight * 0.02,
          horizontal: SizeConfig.screenWidth * 0.04,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        leading: Container(
          height: SizeConfig.screenHeight * 0.075,
          width: SizeConfig.screenHeight * 0.075,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Icon(
            color: const Color.fromRGBO(249, 160, 63, 1),
            Icons.person_rounded,
            size: SizeConfig.blockSizeVertical * 3.2,
          ),
        ),
        title: SizedBox(
          height: SizeConfig.screenHeight * 0.07,
          width: SizeConfig.screenWidth * 0.6,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          roommate.getDisplayName,
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: SizeConfig.blockSizeVertical * 2.4,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Last online: 52 min ago',
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: SizeConfig.blockSizeVertical * 1.4,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: SizeConfig.screenWidth * 0.5,
                  height: SizeConfig.screenHeight * 0.01,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.8),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 249, 159, 63),
                          Color(0xFFF5766A),
                          Color(0xFFCB648C),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: SizeConfig.screenWidth * 0.5 * 0.89,
                  height: SizeConfig.screenHeight * 0.01,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.expand_more_rounded,
                    size: SizeConfig.blockSizeVertical * 3,
                    color: Colors.white,
                  ),
                  splashRadius: SizeConfig.screenHeight * 0.03,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
