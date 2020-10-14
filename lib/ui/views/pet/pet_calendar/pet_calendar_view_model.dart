import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/models/pet.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dogtour_admin/models/reserved_spot.dart';
import 'package:dogtour_admin/services/firestore_service.dart';
import 'package:dogtour_admin/services/user_service.dart';

class PetCalendarViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final UserService _userService = locator<UserService>();

  Pet pet;

  bool isFavourite;
  List<ReservedSpot> takenSpots = [];
  List<int> spots = [];
  DateTime selectedDay;
  int selectedHour;
  PetCalendarViewModel(Pet petDetails) {
    pet = petDetails;
    isFavourite = false;
  }
  Future<void> init(BuildContext context) async {
    try {
      takenSpots = await _firestoreService.getReservedSpots(pet.id);
      changeSelectedDay(DateTime.now());
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  changeSelectedDay(DateTime day) {
    spots = List.generate(24, (index) => index);
    selectedDay = day;
    var takenSportsForTheDay = takenSpots.where((element) =>
        element.start.day == selectedDay.day &&
        element.start.month == selectedDay.month &&
        element.start.year == selectedDay.year);
    spots.removeWhere((element) =>
        takenSportsForTheDay.any((taken) => element == taken.start.hour));
    notifyListeners();
  }

  changeSelectedHour(int hour) {
    selectedHour = hour;
    notifyListeners();
  }

  reserveSpot() async {
    var start = DateTime(
        selectedDay.year, selectedDay.month, selectedDay.day, selectedHour);
    await _firestoreService.addSpotToPetCalendar(
        pet,
        ReservedSpot(
            start: start,
            end: start.add(Duration(hours: 1)),
            userId: _userService.getUser().id));
    _navigationservice.back();
  }

  void goBack() {
    _navigationservice.back();
  }
}
