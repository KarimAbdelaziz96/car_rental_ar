// ignore_for_file: avoid_init_to_null

import 'package:car_rental/calendar_page/calendar_widgets/utils.dart';
import 'package:car_rental/constatnts.dart';
import 'package:car_rental/singleton.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarSelectionRange extends StatefulWidget {
  @override
  _CalendarSelectionRangeState createState() => _CalendarSelectionRangeState();
}

class _CalendarSelectionRangeState extends State<CalendarSelectionRange> {
  final _servicio = new ServicioSingleton();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  late DateTime? _selectedDay = null;
  late DateTime? _rangeStart = null;
  late DateTime? _rangeEnd = null;
  late Duration? _difference = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TableCalendar(
        rowHeight: 35,
        dayHitTestBehavior: HitTestBehavior.opaque,
        headerStyle: HeaderStyle(
          rightChevronIcon:Icon(Icons.arrow_right,
          color: Colors.white,
          ) ,
          leftChevronIcon: Icon(Icons.date_range,
          color: Colors.white,
          ),
          formatButtonVisible: false,
          titleCentered: true,
          headerPadding: EdgeInsets.symmetric(vertical: 3.0),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
          ),
          decoration: BoxDecoration(
            color: Color(0xff0125E1).withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
        daysOfWeekVisible: true,
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w100),
            decoration: BoxDecoration()),
        availableGestures: AvailableGestures.verticalSwipe,
        calendarStyle: CalendarStyle(
            defaultTextStyle: TextStyle(
              color: Colors.white,
            ),
            disabledTextStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
            todayTextStyle: TextStyle(color: kWhite),
            rangeEndTextStyle: TextStyle(color: kWhite),
        
          ),
        locale: 'ar_AR',
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        rangeSelectionMode: _rangeSelectionMode,
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _rangeStart = null; // Important to clean those
              _rangeEnd = null;
              _rangeSelectionMode = RangeSelectionMode.toggledOff;
            });
          }
        },
        onRangeSelected: (start, end, focusedDay) {
          setState(() {
            _selectedDay = null;
            _focusedDay = focusedDay;
            _servicio.diaINICIO.value = start!;
            _servicio.diaFIN.value = end;
            _rangeStart = start;
            _rangeEnd = end;
            _rangeSelectionMode = RangeSelectionMode.toggledOn;
          });

          if (end != null && start != null) {
            _difference = end.difference(start);
            _servicio.diasTOTALES = _difference!.inDays + 1.toInt();
          } else
            return;

          print('البدء $_rangeStart');
          print('نهاية $_rangeEnd');
          print('الايام${_servicio.diasTOTALES}');
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
