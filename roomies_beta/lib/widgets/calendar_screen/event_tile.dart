import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/app_user.dart';
import '../../providers/house.dart';
import '../../models/calendar_event.dart';
import '../../models/size_config.dart';

class EventTile extends StatefulWidget {
  final CalendarEvent event;

  const EventTile({super.key, required this.event});

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> with TickerProviderStateMixin {
  bool _isOpened = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.03),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: SizeConfig.screenWidth * 0.9,
      height: !_isOpened
          ? SizeConfig.screenHeight * 0.08
          : SizeConfig.screenHeight * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!_isOpened)
            Chip(
              backgroundColor:
                  Provider.of<House>(context).getColor(widget.event.getUserId),
              label: Text(
                DateFormat.jm('en_US')
                    .format(
                      widget.event.getEventTime,
                    )
                    .toLowerCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gotham',
                  fontSize: SizeConfig.blockSizeVertical * 1.8,
                ),
              ),
            ),
          if (!_isOpened) SizedBox(width: SizeConfig.screenWidth * 0.03),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight * 0.02,
                horizontal: SizeConfig.screenWidth * 0.04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: _isOpened
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedAlign(
                          alignment: _isOpened
                              ? Alignment.topLeft
                              : Alignment.centerLeft,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            style: _isOpened
                                ? TextStyle(
                                    fontFamily: 'Gotham',
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.4,
                                    color: Colors.black,
                                  )
                                : TextStyle(
                                    fontFamily: 'Gotham',
                                    fontSize: SizeConfig.blockSizeVertical * 2,
                                    color: Colors.black,
                                  ),
                            child: Text(
                              widget.event.getEventName,
                            ),
                          ),
                        ),
                        if (_isOpened)
                          SizedBox(height: SizeConfig.screenHeight * 0.012),
                        if (_isOpened)
                          Row(
                            children: [
                              CircleAvatar(
                                radius: SizeConfig.screenHeight * 0.01,
                                backgroundColor: Provider.of<House>(context)
                                    .getColor(widget.event.getUserId),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.015,
                              ),
                              Text(
                                Provider.of<List<AppUser>>(context)
                                    .firstWhere((element) =>
                                        element.getUserId ==
                                        widget.event.getUserId)
                                    .getDisplayName,
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontFamily: 'Gotham',
                                ),
                              ),
                            ],
                          ),
                        if (_isOpened)
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                        if (_isOpened)
                          Row(
                            children: [
                              Container(
                                height: SizeConfig.screenHeight * 0.05,
                                width: SizeConfig.screenHeight * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.orange.shade50,
                                ),
                                child: Icon(
                                  Icons.access_time_outlined,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: SizeConfig.blockSizeVertical * 2.4,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.03,
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight * 0.04,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat.yMMMMd('en_US')
                                          .format(widget.event.getEventTime),
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontFamily: 'Gotham',
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.6),
                                    ),
                                    Text(
                                      DateFormat.jm('en_US')
                                          .format(widget.event.getEventTime)
                                          .toLowerCase(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Gotham',
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isOpened = !_isOpened;
                          });
                        },
                        radius: 50,
                        borderRadius: BorderRadius.circular(30),
                        child: Icon(
                          _isOpened
                              ? Icons.expand_less_rounded
                              : Icons.expand_more_rounded,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
