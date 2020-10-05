import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/services/firestore_service.dart';
import 'package:dogtour_admin/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final UserService _userService = locator<UserService>();

  Future initialize() async {
    var authResult = await FirebaseAuth.instance.currentUser();

    if (authResult != null) {
      var user = await _firestoreService.getUserProfile(authResult.uid);
      _userService.setUser(user);
      await _navigationservice.replaceWith(Routes.dashboardView);
    } else {
      await _navigationservice.replaceWith(Routes.welcomeView);
    }
  }
}
