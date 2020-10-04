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
                  TextField(
                    onChanged: (value) => model.email = value,
                    decoration: InputDecoration(hintText: "E-mail"),
                  ),
                  TextField(
                    onChanged: (value) => model.password = value,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  FlatButton(
                      onPressed: () => model.signIn(), child: Text("Log in")),
                ]))),
        onModelReady: (model) async {
          await model.init(context);
        },
        viewModelBuilder: () => LoginViewModel());
  }
}
