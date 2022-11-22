import 'package:flutter/material.dart';

import '../../models/size_config.dart';
import '../../providers/house.dart';

class HouseItem extends StatelessWidget {
  final House houseComponent;

  const HouseItem({super.key, required this.houseComponent});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.03),
        width: SizeConfig.screenWidth * 0.85,
        height: SizeConfig.screenHeight * 0.12,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF5766A),
              Color(0xFFF9A03F),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.02,
              vertical: SizeConfig.screenHeight * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: SizeConfig.screenHeight * 0.036,
                backgroundColor: const Color(0xFFFFF7EB),
                foregroundColor: Colors.transparent,
                child: const Icon(
                  Icons.home_rounded,
                  color: Color(0xFFF5766A),
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.02,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    houseComponent.getHouseName,
                    style: TextStyle(
                      color: const Color(0xFFFFF7EB),
                      fontFamily: 'Gotham',
                      fontSize: SizeConfig.blockSizeVertical * 2.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
