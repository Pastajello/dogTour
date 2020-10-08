import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {
  bool isSignedIn = false;
  final NavigationService _navigationservice = locator<NavigationService>();

  double loginOpacity = 0.0;
  double registerOpacity = 0.0;

  double loginPadding = 0.0;
  double registerPadding = 0.0;

  Future initialize() async {
    await setAnimations();
  }

  Future setAnimations() async {
    loginPadding = 100;
    registerPadding = 0;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    loginOpacity = 1;
    loginPadding = 150;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    registerOpacity = 1;
    registerPadding = 50;
    notifyListeners();
  }

  Future navigateToLoginScreen() async {
    await _navigationservice.navigateTo(Routes.loginView);
  }

  Future navigateToRegistration() async {
    _navigationservice.navigateTo(Routes.registerView);
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
