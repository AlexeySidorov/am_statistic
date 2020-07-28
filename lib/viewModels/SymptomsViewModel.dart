import 'package:flutter/material.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';

class SymptomsViewModel extends BaseViewModel {
  SymptomsViewModel();

  @override
  void active() {}

  @override
  void deactive() {}

  BuildContext _context;

  @override
  Future<void> registryProperties(BuildContext context) async {
    _context = context;
  }

  @override
  void init() {
    // TODO: implement init
  }
}
