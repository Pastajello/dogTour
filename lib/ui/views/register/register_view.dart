import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'register_view_model.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
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
        viewModelBuilder: () => RegisterViewModel());
  }
}
