import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();

  Future initialize() async {
    var userInfo = await FirebaseAuth.instance.currentUser();
    if (userInfo != null) {
      await _navigationservice.replaceWith(Routes.dashboardView);
    } else {
      await _navigationservice.replaceWith(Routes.welcomeView);
    }
  }
}
