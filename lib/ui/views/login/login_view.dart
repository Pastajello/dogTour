import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(),
            body: Container(
                color: Colors.white,
                child: Column(children: [
                  TextField(),
                  FlatButton(
                      onPressed: () => model.signIn(), child: Text("olaboga")),
                ]))),
        onModelReady: (model) async {
          await model.init(context);
        },
        viewModelBuilder: () => LoginViewModel());
  }
}
