import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pet_details_view_model.dart';

class PetDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routeData = RouteData.of(context).arguments as List;
    return ViewModelBuilder<PetDetailsViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(),
              body: Container(
                child: ListView(
                  children: [
                    Hero(
                        tag: "petProfilePic${routeData[1]}",
                        child: Image.network(model.pet.profilePicUrl)),
                  ],
                ),
              ),
            ),
        onModelReady: (model) async {
          await model.init(context);
        },
        viewModelBuilder: () => PetDetailsViewModel(routeData[0]));
  }
}
