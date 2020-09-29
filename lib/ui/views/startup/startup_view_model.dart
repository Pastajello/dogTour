import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  bool isSignedIn = false;
  final NavigationService _navigationservice = locator<NavigationService>();

  Future initialize() async {
    await Future.delayed(Duration(seconds: 2));

    var userInfo = await FirebaseAuth.instance.currentUser();
    if (userInfo != null) {
      await _navigationservice.replaceWith(Routes.dashboardView);
    } else {
      await _navigationservice.replaceWith(Routes.loginView);
    }
  }

  Future navigateToLoginScreen() async {
    await _navigationservice.navigateTo(Routes.loginView);
  }

  void goForward() {
    _navigationservice.replaceWith(Routes.dashboardView);
  }

  void signInAnonymously() async {
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      isSignedIn = true;
      notifyListeners();
      print('${authResult.user.uid}');
    } catch (e) {
      print(e.toString());
    }
  }
}
