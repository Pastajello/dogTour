import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @LazySingleton()
  NavigationService get navigationService;
  @LazySingleton()
  DialogService get dialogService;
}
