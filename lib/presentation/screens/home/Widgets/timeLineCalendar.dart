
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:todo/core/utiles/colors_Manager.dart';


Widget timeLineCalendar({required Function(DateTime) onChangeDateTime, Color ?color}) {

  return TimelineCalendar(
    calendarType: CalendarType.GREGORIAN,
    calendarLanguage: "en",
    calendarOptions: CalendarOptions(
      viewType: ViewType.DAILY,
      toggleViewType: true,
      headerMonthElevation: 10,

      headerMonthBackColor: Colors.transparent,
    ),
    dayOptions: DayOptions(
todayTextColor: Colors.blue,
      compactMode: true,
      weekDaySelectedColor: const Color(0xff3AC3E2),
selectedBackgroundColor: Colors. transparent,

      disableDaysBeforeNow: true,
    ),
    headerOptions: HeaderOptions(

      weekDayStringType: WeekDayStringTypes.SHORT,
      monthStringType: MonthStringTypes.FULL,
      backgroundColor: ColorsManager.BlueColor,

    ),
    onChangeDateTime: (CalendarDateTime selectedDateTime) {
      // Extract the DateTime from CalendarDateTime and pass it to onChangeDateTime
      DateTime date = DateTime(

        selectedDateTime.year,
        selectedDateTime.month,
        selectedDateTime.day,
      );
      onChangeDateTime(date); // Send the DateTime to the parent widget
    },
  );
}

