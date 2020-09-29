import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_view_model.dart';
import '../../resources.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  onPressed: () async {
                    await model.navigateToAddPet();
                  },
                  icon: Icon(
                    Icons.add,
                    size: 40,
                  ),
                  color: Colors.black,
                )
              ],
              backgroundColor: R.colors.main,
            ),
            body: Container(
                color: Colors.white,
                child: RefreshIndicator(
                  onRefresh: () async => await model.getPets(),
                  child: ListView.builder(
                    itemCount: model.pets.length,
                    itemBuilder: (context, index) {
                      var pet = model.pets[index];
                      return InkWell(
                        onTap: () async => await model.navigateToPetDetais(pet),
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(pet.name),
                            leading: Image.network(pet.profilePicUrl),
                          ),
                        ),
                      );
                    },
                  ),
                ))),
        onModelReady: (model) async => await model.init(),
        viewModelBuilder: () => DashboardViewModel());
  }
}
