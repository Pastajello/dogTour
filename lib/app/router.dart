import 'package:auto_route/auto_route_annotations.dart';
import 'package:dogtour_admin/ui/views/Dashboard/dashboard_view.dart';
import 'package:dogtour_admin/ui/views/login/login_view.dart';
import 'package:dogtour_admin/ui/views/pet/add_pet/add_pet_view.dart';
import 'package:dogtour_admin/ui/views/pet/pet_calendar/pet_calendar_view.dart';
import 'package:dogtour_admin/ui/views/pet/pet_details/pet_details_view.dart';
import 'package:dogtour_admin/ui/views/register/register_view.dart';
import 'package:dogtour_admin/ui/views/startup/startup_view.dart';
import 'package:dogtour_admin/ui/views/welcome/welcome_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: WelcomeView),
    MaterialRoute(
      page: AddPetView,
    ),
    MaterialRoute(page: PetDetailsView),
    MaterialRoute(page: PetCalendarView),
    MaterialRoute(
      page: DashboardView,
    ),
  ],
)
class $Router {}
