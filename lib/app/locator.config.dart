// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/authetication_service.dart';
import '../services/firestore_service.dart';
import '../services/permission_servic.dart';
import '../services/third_party/third_party_services_model.dart';
import '../services/user_service.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.factory<AutheticationService>(() => AutheticationService());
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.factory<FirestoreService>(() => FirestoreService());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.factory<PermissionService>(() => PermissionService());

  // Eager singletons must be registered in the right order
  gh.singleton<UserService>(UserService());
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
