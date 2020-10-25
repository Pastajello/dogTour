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
              appBar: AppBar(),
              body: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FlatButton(
                            onPressed: model.reserveSpot,
                            child: Text("Go for a walk!")),
                        TableCalendar(
                          enabledDayPredicate: (day) {
                            var now = DateTime.now();
                            var isToday = day.year == now.year &&
                                day.month == now.month &&
                                day.day == now.day;
                            return day.isAfter(DateTime.now()) || isToday;
                          },
                          calendarController: _calendarController,
                          onDaySelected: (day, events, holidays) {
                            model.changeSelectedDay(day);
                          },
                          initialCalendarFormat: CalendarFormat.twoWeeks,
                          initialSelectedDay: DateTime.now(),
                          calendarStyle: CalendarStyle(
                              weekdayStyle: TextStyle(color: Colors.black)),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.spots.length,
                          itemBuilder: (context, index) {
                            var spot = model.spots[index];
                            return InkWell(
                                splashColor: Colors.red,
                                focusColor: Colors.green,
                                highlightColor: Colors.blue,
                                hoverColor: Colors.purple,
                                onTap: () {
                                  model.changeSelectedHour(spot);
                                },
                                child: Card(
                                    child: ListTile(
                                  selectedTileColor: Colors.red,
                                  selected: model.selectedHour == spot,
                                  focusColor: Colors.red,
                                  title: Text(spot.toString()),
                                )));
                          },
                        )
                      ],
                    ),
                  )),
            ),
        onModelReady: (model) async {
          await model.init(context);
        },
        viewModelBuilder: () => PetCalendarViewModel(routeData[0]));
  }
}
