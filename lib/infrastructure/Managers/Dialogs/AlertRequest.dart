import 'package:flutter/widgets.dart';

class AlertRequest {
  final String title;
  final String message;
  final String oneButtonTitle;
  final String twoButtonTitle;
  final DialogType dialogType;

  AlertRequest({
    @required this.dialogType,
    @required this.title,
    @required this.message,
    @required this.oneButtonTitle,
    @required this.twoButtonTitle
  });
}

enum DialogType{
    dialogMessage,
    questionDialogMessage,
    progressDialog
  }