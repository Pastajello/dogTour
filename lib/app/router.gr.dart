// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/Dashboard/dashboard_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/pet/add_pet/add_pet_view.dart';
import '../ui/views/pet/pet_calendar/pet_calendar_view.dart';
import '../ui/views/pet/pet_details/pet_details_view.dart';
import '../ui/views/register/register_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/welcome/welcome_view.dart';

class Routes {
  static const String startupView = '/';
  static const String loginView = '/login-view';
  static const String registerView = '/register-view';
  static const String welcomeView = '/welcome-view';
  static const String addPetView = '/add-pet-view';
  static const String petDetailsView = '/pet-details-view';
  static const String petCalendarView = '/pet-calendar-view';
  static const String dashboardView = '/dashboard-view';
  static const all = <String>{
    startupView,
    loginView,
    registerView,
    welcomeView,
    addPetView,
    petDetailsView,
    petCalendarView,
    dashboardView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.addPetView, page: AddPetView),
    RouteDef(Routes.petDetailsView, page: PetDetailsView),
    RouteDef(Routes.petCalendarView, page: PetCalendarView),
    RouteDef(Routes.dashboardView, page: DashboardView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeView(),
        settings: data,
      );
    },
    AddPetView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddPetView(),
        settings: data,
      );
    },
    PetDetailsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PetDetailsView(),
        settings: data,
      );
    },
    PetCalendarView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PetCalendarView(),
        settings: data,
      );
    },
    DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardView(),
        settings: data,
      );
    },
  };
}
