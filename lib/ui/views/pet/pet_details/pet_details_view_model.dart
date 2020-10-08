import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/models/pet.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PetDetailsViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();

  Pet pet;

  bool isFavourite;

  PetDetailsViewModel(Pet petDetails) {
    pet = petDetails;
    isFavourite = false;
  }
  Future<void> init(BuildContext context) async {}

  void goBack() {
    _navigationservice.back();
  }

  void setAsFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }

  void showPicture(Widget image) {
    _navigationservice.navigateToView(image);
  }

  Future navigateToCalendar() async {
    _navigationservice.navigateTo(Routes.petCalendarView, arguments: [pet]);
  }
}
