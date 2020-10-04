import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

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
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "michal.sierpinski@pm.me", password: "12345678");
      final CollectionReference _usersCollectionReference =
          Firestore.instance.collection("profiles");

      var user = authResult.user;
      await _usersCollectionReference.document(user.uid).setData(User(
              email: "michal.sierpinski@pm.me",
              fullName: "$firstName $lastName",
              id: user.uid,
              userRole: "admin")
          .toJson());
      final asdagh = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "michal.sierpinski@pm.me", password: "12345678");
      _navigationservice.replaceWith(Routes.dashboardView);
    } catch (e) {
      print(e.toString());
    }
  }
}
