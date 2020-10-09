import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

import 'pet_calendar_view_model.dart';

class PetCalendarView extends StatelessWidget {
  var _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    var routeData = RouteData.of(context).arguments as List;
    return ViewModelBuilder<PetCalendarViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
                body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  TableCalendar(
                    calendarController: _calendarController,
                    calendarStyle: CalendarStyle(
                        weekdayStyle: TextStyle(color: Colors.black)),
                  )
                ],
              ),
            )),
        onModelReady: (model) async {
          await model.init(context);
        },
        viewModelBuilder: () => PetCalendarViewModel(routeData[0]));
  }
}
