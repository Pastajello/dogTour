import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/models/permission_state.dart';
import 'package:dogtour_admin/models/pet.dart';
import 'package:dogtour_admin/services/permission_servic.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PetDetailsViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final PermissionService _permissionService = locator<PermissionService>();
  final DialogService _dialogService = locator<DialogService>();

  Pet pet;

  bool isFavourite;

  PermissionState canWalkPet;
  PermissionState canEditPet;
  PermissionState canAdoptPet;
  PermissionState canSponsorPet;

  PetDetailsViewModel(Pet petDetails) {
    pet = petDetails;
    isFavourite = false;
  }
  Future<void> init(BuildContext context) async {
    canWalkPet = _permissionService.canUser(UserPermission.walkPet);
    canEditPet = _permissionService.canUser(UserPermission.editPet);
    canAdoptPet = _permissionService.canUser(UserPermission.adoptPet);
    canSponsorPet = _permissionService.canUser(UserPermission.sponsorPet);
  }

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
    if (canWalkPet == PermissionState.allowed)
      _navigationservice.navigateTo(Routes.petCalendarView, arguments: [pet]);
    else if (canWalkPet == PermissionState.login) {
      var result = await _dialogService.showDialog(
          barrierDismissible: true,
          title: "Wait",
          buttonTitle: "ok",
          cancelTitle: "nope",
          description: "You need to login first to walk this pet");
      if (result.confirmed) {
        await _navigationservice
            .navigateTo(Routes.loginView, arguments: [true]);
      }
    }
  }
}
