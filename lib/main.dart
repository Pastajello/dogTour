import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogtour_admin/ui/dialogs/setup_dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/services.dart';
import 'app/locator.dart';
import 'app/router.gr.dart' as AutoRoute;

Firestore firestoreInstance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  setupDialogUi();
  SharedPreferences.setMockInitialValues({});
  firestoreInstance = Firestore.instance;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            canvasColor: Colors.transparent,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: AutoRoute.Routes.startupView,
          onGenerateRoute: AutoRoute.Router().onGenerateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
        ));
  }

  void signInAnonymously() async {
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      print('${authResult.user.uid}');
    } catch (e) {
      print(e.toString());
    }
  }
}
