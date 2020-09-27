import 'package:dogtour_admin/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  var dialogService = locator<DialogService>();
  TextEditingController authenticationCodeController = TextEditingController();

  dialogService.registerCustomDialogBuilder(
      variant: "asd",
      builder: (context, dialogRequest) => Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    dialogRequest.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: authenticationCodeController,
                  ),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      dialogService.completeDialog(DialogResponse(
                          confirmed: true, responseData: ["fgh"]));
                    },
                    child: Text(dialogRequest.mainButtonTitle),
                  ),
                ],
              ),
            ),
          ));
}
