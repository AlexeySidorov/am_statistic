import 'dart:async';

import 'package:statistic_covid19/infrastructure/Managers/Dialogs/AlertRequest.dart';

class DialogService {
  Function(AlertRequest) _showDialogListener;
  Function _closeDialogListener;
  Completer _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  void registrationCloseDialogListener(Function closeDialogListener) {
    _closeDialogListener = closeDialogListener;
  }

  Future showDialog(DialogType type,
      {String title,
      String message,
      String oneButtonTitle,
      String twoButtonTitle}) {
    _dialogCompleter = Completer();

    if (_showDialogListener != null)
      _showDialogListener(AlertRequest(
          title: title,
          message: message,
          oneButtonTitle: oneButtonTitle,
          twoButtonTitle: twoButtonTitle,
          dialogType: type));

    return _dialogCompleter.future;
  }

  void closeDialog() {
    if (_closeDialogListener != null) _closeDialogListener();
  }

  void dialogComplete() {
    _dialogCompleter.complete();
    _dialogCompleter = null;
  }
}
