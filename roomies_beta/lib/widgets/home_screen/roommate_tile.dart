import 'package:flutter/material.dart';

import '../../models/size_config.dart';
import '../../providers/app_user.dart';

class RoommateTile extends StatelessWidget {
  final AppUser roommate;

  const RoommateTile({super.key, required this.roommate});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListTile(
      tileColor: const Color(0xFFDFE0DF),
      contentPadding: EdgeInsets.symmetric(
        vertical: SizeConfig.screenHeight * 0.015,
        horizontal: SizeConfig.screenWidth * 0.04,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Container(
        color: const Color(0xFFFFF7EB),
        height: SizeConfig.screenHeight * 0.02,
        width: SizeConfig.screenWidth * 0.03,
      ),
      title: Text(
        roommate.getDisplayName,
        style: TextStyle(
          fontFamily: 'Gotham',
          fontSize: SizeConfig.blockSizeVertical * 2.4,
          color: const Color(0xFF2F4858),
        ),
      ),
    );
  }
}
