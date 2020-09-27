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
                    await model.addPet();
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  color: Colors.black,
                )
              ],
              backgroundColor: R.colors.main,
            ),
            body: Container()),
        onModelReady: (model) async => await model.init(),
        viewModelBuilder: () => DashboardViewModel());
  }
}
