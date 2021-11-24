import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class Calender_screen extends StatelessWidget {
  const Calender_screen({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context) {
    return  SfCalendar(
      view: CalendarView.month,
    );

  }
}
