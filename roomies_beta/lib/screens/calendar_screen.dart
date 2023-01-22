import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:roomies_beta/models/calendar_event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import '../widgets/calendar_screen/event_tile.dart';
import '../providers/house.dart';
import '../providers/app_user.dart';
import '../models/size_config.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _firstDate =
      DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  DateTime _lastDate =
      DateTime.utc(DateTime.now().year, DateTime.now().month + 1, 0);
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  Map<DateTime, List<CalendarEvent>> _eventMap = {};

  @override
  void didChangeDependencies() {
    _eventMap[DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day)] = [
      CalendarEvent(Provider.of<AppUser>(context, listen: false).getUserId,
          DateTime.now(), 'Homework', 'High'),
      CalendarEvent(Provider.of<AppUser>(context, listen: false).getUserId,
          DateTime.now(), 'Interview', 'High'),
    ];
    super.didChangeDependencies();
  }

  List<CalendarEvent>? getEventsOfDate(DateTime day) {
    if (_eventMap.containsKey(DateTime.utc(day.year, day.month, day.day))) {
      return _eventMap[DateTime.utc(day.year, day.month, day.day)];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight * 0.02,
          horizontal: SizeConfig.screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat.yMMMM('en_US').format(_selectedDate),
                    style: TextStyle(
                      fontFamily: 'Gotham',
                      fontSize: SizeConfig.blockSizeVertical * 3.4,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(
                        () {
                          _firstDate = DateTime.utc(
                              _firstDate.year, _firstDate.month - 1, 1);
                          _lastDate =
                              DateTime.utc(_lastDate.year, _lastDate.month, 0);
                          _selectedDate = DateTime.utc(_selectedDate.year,
                              _selectedDate.month - 1, _selectedDate.day);
                        },
                      );
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left_rounded,
                      size: SizeConfig.blockSizeVertical * 4.6,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(
                        () {
                          _firstDate = DateTime.utc(
                              _firstDate.year, _firstDate.month + 1, 1);
                          _lastDate = DateTime.utc(
                              _lastDate.year, _lastDate.month + 2, 0);
                          _selectedDate = DateTime.utc(_selectedDate.year,
                              _selectedDate.month + 1, _selectedDate.day);
                        },
                      );
                    },
                    child: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: SizeConfig.blockSizeVertical * 4.6,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.05),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight * 0.04,
                horizontal: SizeConfig.screenWidth * 0.03,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7EB),
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: TableCalendar(
                calendarBuilders: CalendarBuilders(
                  singleMarkerBuilder: (context, day, event) {
                    CalendarEvent calendarEvent = event as CalendarEvent;
                    return Container(
                      height: SizeConfig.screenHeight * 0.01,
                      width: SizeConfig.screenHeight * 0.01,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Provider.of<House>(context)
                              .getColor(event.getUserId)),
                    );
                  },
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },
                daysOfWeekHeight: 30,
                headerVisible: false,
                daysOfWeekStyle: DaysOfWeekStyle(
                  dowTextFormatter: (date, locale) =>
                      DateFormat.E(locale).format(date).substring(0, 2),
                  weekdayStyle: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: SizeConfig.blockSizeVertical * 1.6,
                    color: Colors.grey.shade500,
                  ),
                  weekendStyle: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: SizeConfig.blockSizeVertical * 1.6,
                    color: Colors.grey.shade500,
                  ),
                ),
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: SizeConfig.blockSizeVertical * 1.6,
                  ),
                  weekendTextStyle: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: SizeConfig.blockSizeVertical * 1.6,
                  ),
                  todayTextStyle: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: SizeConfig.blockSizeVertical * 2,
                    color: Colors.white,
                  ),
                  todayDecoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 203, 148),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Color.fromARGB(255, 249, 159, 63),
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: SizeConfig.blockSizeVertical * 2,
                    color: Colors.white,
                  ),
                  outsideTextStyle: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: SizeConfig.blockSizeVertical * 1.6,
                  ),
                ),
                availableGestures: AvailableGestures.horizontalSwipe,
                pageJumpingEnabled: true,
                eventLoader: (day) {
                  if (getEventsOfDate(day) != null) {
                    return getEventsOfDate(day) as List<CalendarEvent>;
                  }
                  return [];
                },
                firstDay: _firstDate,
                lastDay: _lastDate,
                focusedDay: _selectedDate,
              ),
            ),
            getEventsOfDate(_selectedDate) != null
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight * 0.05),
                        child: Text(
                          'Events',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: SizeConfig.blockSizeVertical * 2.6,
                            fontFamily: 'Gotham',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.5,
                        width: SizeConfig.screenWidth * 0.9,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: getEventsOfDate(_selectedDate)!.length,
                          itemBuilder: (context, index) {
                            return EventTile(
                              event: getEventsOfDate(_selectedDate)![index],
                            );
                          },
                        ),
                      )
                    ],
                  )
                : Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 0.08,
                      horizontal: SizeConfig.screenWidth * 0.04,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "No events for the day!",
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: SizeConfig.blockSizeVertical * 3.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Lottie.network(
                            'https://assets7.lottiefiles.com/packages/lf20_4fewfamh.json')
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
