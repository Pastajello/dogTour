import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/models/pet.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future navigateToPlaces() async {
    //await _navigationservice.navigateTo(Routes.loginView);
  }

  Future addPet() async {
    await _navigationservice.navigateTo(Routes.addPetView);
  }

  Future init() async {
    var a = await Firestore.instance.collection("pets").getDocuments();
    var aasd = a.documents.map((e) {
      //var json = jsonDecode();
      var pet = Pet.fromJson(e.data);
      return pet;
    }).toList();
    int i = 5;
  }
}
