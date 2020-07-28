import 'package:flutter/material.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';

class ReportViewModel extends BaseViewModel {
  @override
  void active() {}

  @override
  void deactive() {}

  BuildContext _context;

  @override
  void registryProperties(BuildContext context) {
    _context = context;
  }

  @override
  void init() {
    // TODO: implement init
  }
}
