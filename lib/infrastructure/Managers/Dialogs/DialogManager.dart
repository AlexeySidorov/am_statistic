import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/Managers/Dialogs/AlertRequest.dart';
import 'package:statistic_covid19/infrastructure/Services/DialogService.dart';
import 'package:statistic_covid19/infrastructure/Services/ServiceLocator.dart';
import 'package:statistic_covid19/infrastructure/Utils/ColorsApp.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  ProgressDialog dialog;

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
    _dialogService.registrationCloseDialogListener(_closeDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    if (request == null) return;

    switch (request.dialogType) {
      case DialogType.dialogMessage:
        {
          Alert(
              context: context,
              title: request.title,
              desc: request.message,
              closeFunction: () => _dialogService.dialogComplete(),
              buttons: [
                DialogButton(
                  child: Text(request.oneButtonTitle),
                  onPressed: () {
                    _dialogService.dialogComplete();
                    Navigator.of(context).pop();
                  },
                )
              ]).show();
          break;
        }
      case DialogType.questionDialogMessage:
        Alert(
            context: context,
            title: request.title,
            desc: request.message,
            closeFunction: () => _dialogService.dialogComplete(),
            buttons: [
              DialogButton(
                child: Text(request.oneButtonTitle),
                onPressed: () {
                  _dialogService.dialogComplete();
                  Navigator.of(context).pop();
                },
              ),
              DialogButton(
                child: Text(request.twoButtonTitle),
                onPressed: () {
                  _dialogService.dialogComplete();
                  Navigator.of(context).pop();
                },
              ),
            ]).show();
        break;
      case DialogType.progressDialog:
        if (dialog != null && dialog.isShowing()) return;

        dialog = ProgressDialog(context,
            type: ProgressDialogType.Normal,
            isDismissible: false,
            showLogs: false);

        dialog.update(
          progress: 50.0,
          message: request.message == null || request.message.isEmpty
              ? "Please wait..."
              : request.message,
          progressWidget: Container(
            width: 32,
            height: 32,
            margin: EdgeInsets.all(14),
            child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor)),
          ),
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
              color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
        );

        dialog.show();

        break;
    }
  }

  void _closeDialog() {
    if (dialog != null && dialog.isShowing()) dialog.hide();
  }
}
