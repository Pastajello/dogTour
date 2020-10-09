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
                  TextField(
                    onChanged: (value) => model.email = value,
                    decoration: InputDecoration(hintText: "E-mail"),
                  ),
                  TextField(
                    onChanged: (value) => model.password = value,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  TextField(
                    onChanged: (value) => model.repeatPassword = value,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Repeat password"),
                  ),
                  TextField(
                    onChanged: (value) => model.firstName = value,
                    decoration: InputDecoration(hintText: "First name"),
                  ),
                  TextField(
                    onChanged: (value) => model.lastName = value,
                    decoration: InputDecoration(hintText: "Last name"),
                  ),
                  FlatButton(
                      onPressed: () => model.signUp(), child: Text("Register")),
                ]))),
        onModelReady: (model) async {
          await model.init(context);
        },
        viewModelBuilder: () => RegisterViewModel());
  }
}
