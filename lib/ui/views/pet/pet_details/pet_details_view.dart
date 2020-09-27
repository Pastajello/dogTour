import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pet_details_view_model.dart';

class PetDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PetDetailsViewModel>.reactive(
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
        viewModelBuilder: () => PetDetailsViewModel());
  }
}
