import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/models/permission_state.dart';
import 'package:dogtour_admin/models/pet.dart';
import 'package:dogtour_admin/services/permission_servic.dart';
import 'package:dogtour_admin/services/authetication_service.dart';
import 'package:dogtour_admin/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final PermissionService _permissionService = locator<PermissionService>();
  final UserService _userService = locator<UserService>();
  final AutheticationService _autheticationService =
      locator<AutheticationService>();

  List<Pet> pets = [];

  PermissionState canAddPet = PermissionState.forbidden;
  bool isSignedIn = false;

  Future init() async {
    await getPets();
    setPermissions();
  }

  Future navigateToAddPet() async {
    await _navigationservice.navigateTo(Routes.addPetView);

    notifyListeners();
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

  logout() async {
    _autheticationService.signOut();
    setPermissions();
  }

  login() async {
    await _navigationservice.navigateTo(Routes.loginView);
    setPermissions();
  }

  setPermissions() async {
    canAddPet = _permissionService.canUser(UserPermission.addPet);
    isSignedIn = _userService.getUser() != null;
    notifyListeners();
  }
}
