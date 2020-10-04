import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  var userLocationOptions;

  bool isSignedIn;

  Future<void> init(BuildContext context) async {}

  String email;
  String password;

  Future signIn() async {
    try {
      final authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _navigationservice.replaceWith(Routes.dashboardView);
    } catch (e) {
      print(e.toString());
    }
  }
}
