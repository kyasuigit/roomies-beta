import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/size_config.dart';
import '../../providers/app_user.dart';
import './roommate_tile.dart';

class RoommatesWidget extends StatefulWidget {
  const RoommatesWidget({super.key});

  @override
  State<RoommatesWidget> createState() => _RoommatesWidgetState();
}

class _RoommatesWidgetState extends State<RoommatesWidget> {
  final int _userCount = 4;
  bool _isMinimized = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: const Text(
                'Roommates',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gotham',
                  color: Color(0xFF2F4858),
                ),
              ),
            ),
            IconButton(
              icon: _isMinimized
                  ? const Icon(Icons.add, color: Color(0xFF2F4858))
                  : const Icon(Icons.remove, color: Color(0xFF2F4858)),
              splashRadius: 20,
              onPressed: () {
                setState(() {
                  _isMinimized = !_isMinimized;
                });
              },
            ),
          ],
        ),
        _isMinimized
            ? Container()
            : SizedBox(
                width: SizeConfig.screenWidth * 0.9,
                height: SizeConfig.screenHeight * 0.4,
                child: ListView.builder(
                  itemCount: Provider.of<List<AppUser>>(context).length,
                  itemBuilder: (context, index) => RoommateTile(
                    roommate: Provider.of<List<AppUser>>(context)[index],
                  ),
                ),
              ),
      ],
    );
  }
}
