import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/models/user.dart';
import 'package:dogtour_admin/services/authetication_service.dart';
import 'package:dogtour_admin/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final AutheticationService _autheticationService =
      locator<AutheticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  var userLocationOptions;

  bool isSignedIn;
  String email;
  String firstName;
  String password;
  String repeatPassword;
  String lastName;
  String role;
  String organization;
  Future<void> init(BuildContext context) async {}

  Future signUp() async {
    try {
      final authResult = await _autheticationService.signUp(
          "michal.sierpinski@pm.me", "12345678");

      var user = authResult.user;

      await _firestoreService.createUser(User(
          email: "michal.sierpinski@pm.me",
          fullName: "$firstName $lastName",
          id: user.uid,
          userRole: "admin"));
      await _autheticationService.signInWithEmail(
          "michal.sierpinski@pm.me", "12345678");

      _navigationservice.replaceWith(Routes.dashboardView);
    } catch (e) {
      print(e.toString());
    }
  }
}
