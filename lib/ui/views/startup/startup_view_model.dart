import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:dogtour_admin/services/authetication_service.dart';
import 'package:dogtour_admin/services/firestore_service.dart';
import 'package:dogtour_admin/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AutheticationService _autheticationService =
      locator<AutheticationService>();
  final UserService _userService = locator<UserService>();

  Future initialize() async {
    var authResult = await FirebaseAuth.instance.currentUser();

    if (authResult != null) {
      if (!authResult.isAnonymous) {
        var user = await _firestoreService.getUserProfile(authResult.uid);
        _userService.setUser(user);
      }
    } else {
      await _autheticationService.signInAnonymously();
    }
    await _navigationservice.clearStackAndShow(Routes.dashboardView);
  }
}
