import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/services/authetication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final AutheticationService _autheticationService =
      locator<AutheticationService>();

  String email;
  String password;

  Future signIn() async {
    try {
      await _autheticationService.signInWithEmail(email, password);
      _navigationservice.replaceWith(Routes.dashboardView);
    } catch (e) {
      print(e.toString());
    }
  }
}
