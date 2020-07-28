import 'package:flutter/material.dart';
import 'package:mvvm/mvvm.dart';

abstract class BaseViewModel extends ViewModel with AsyncViewModelMixin {
  BaseViewModel();

  @override
  void viewInit(BuildContext context) {
    super.viewInit(context);
    registryProperties(context);
    init();
  }

  @override
  void viewReady(BuildContext context) {
    super.viewReady(context);
    active();
  }

  ///Init the view
  void init();

  ///The view is onStart/onResume
  void active();

  ///The view is onPause/onDisposed
  void deactive();

  void registryProperties(BuildContext context);
}
