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

  List<Pet> pets = [];

  Future navigateToAddPet() async {
    await _navigationservice.navigateTo(Routes.addPetView);
  }

  Future init() async {
    await getPets();
  }

  Future navigateToPetDetais(Pet pet, int index) async {
    await _navigationservice
        .navigateTo(Routes.petDetailsView, arguments: [pet, index]);
  }

  Future getPets() async {
    var petCollection =
        await Firestore.instance.collection("pets").getDocuments();
    pets = petCollection.documents
        .where((element) => element.data["name"] != "")
        .map((e) {
      try {
        var pet = Pet.fromJson(e.data);
        return pet;
      } catch (e) {
        return null;
      }
    }).toList();
    pets.removeWhere((element) => element.name == null);
    notifyListeners();
  }
}
