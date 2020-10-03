import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  var userLocationOptions;

  bool isSignedIn;

  Future<void> init(BuildContext context) async {}

  Future signIn() async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "michal.sierpinski@pm.me", password: "12345678");
      _navigationservice.navigateTo(Routes.dashboardView);
    } catch (e) {
      print(e.toString());
    }
  }
}
