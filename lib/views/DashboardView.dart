import 'package:flutter/material.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/Utils/ColorsApp.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:statistic_covid19/viewModels/DashboardViewModel.dart';

import 'package:statistic_covid19/viewModels/StatisticViewModel.dart';
import 'package:statistic_covid19/viewModels/WorldViewModel.dart';
import 'package:statistic_covid19/views/MenuView.dart';
import 'package:statistic_covid19/views/StatisticView.dart';
import 'package:statistic_covid19/views/WorldView.dart';

class DashboardView extends BaseView<DashboardViewModel> {
  StatisticView _statisticView;
  WorldView _worldView;
  //ReportView _reportView;
  bool isVisibleRefreshButton = true;

  DashboardView(DashboardViewModel model) : super(model);

  BaseView _getScreen(int index) {
    if (_statisticView == null &&
        _worldView == null /*&& _reportView == null*/) {
      _statisticView = StatisticView(StatisticViewModel());
      _worldView = WorldView(WorldViewModel());
      // _reportView = ReportView(ReportViewModel());
    }

    switch (index) {
      case 0:
        isVisibleRefreshButton = false;
        return _worldView;
      // case 2:
      // return _reportView;
      case 1:
        isVisibleRefreshButton = true;
        return _statisticView;
      default:
        return _worldView;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            drawer: MenuView(),
            appBar: AppBar(
              backgroundColor: ColorsApp.primaryColor,
              title: Text(S.of(context).statistic),
              actions: [
                Visibility(
                    visible: isVisibleRefreshButton,
                    child: IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        _worldView.$Model.updateData();
                      },
                    )),
              ],
            ),
            body: _getScreen($Model.currentIndex),
            bottomNavigationBar: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: BottomNavigationBar(
                  selectedItemColor: ColorsApp.selectTabColor,
                  unselectedItemColor: ColorsApp.unselectTabColor,
                  onTap: (newIndex) =>
                      setState(() => $Model.setTabNavigation(newIndex)),
                  currentIndex: $Model.currentIndex,
                  items: $Model
                      .getBottomBar()
                      .map((e) => BottomNavigationBarItem(
                          title: Text(e.title),
                          icon: Image.asset(e.unselectIconUrl),
                          activeIcon: Image.asset(e.selectIconUrl)))
                      .toList(),
                ))));
  }
}
