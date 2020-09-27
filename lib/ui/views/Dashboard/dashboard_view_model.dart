import 'package:dogtour_admin/app/locator.dart';
import 'package:dogtour_admin/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  final NavigationService _navigationservice = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future navigateToPlaces() async {
    //await _navigationservice.navigateTo(Routes.loginView);
  }

  Future addPet() async {
    await _navigationservice.navigateTo(Routes.loginView);
  }
}
