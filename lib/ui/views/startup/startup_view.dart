import 'package:dogtour_admin/ui/views/startup/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) =>
          Center(child: CircularProgressIndicator()),
      onModelReady: (model) async {
        await model.initialize();
      },
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
