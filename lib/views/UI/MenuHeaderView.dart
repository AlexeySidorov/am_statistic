import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statistic_covid19/viewModels/MenuViewModel.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:statistic_covid19/views/UI/TitleTextView.dart';

class MenuHeaderView extends BaseView<MenuViewModel> {
  MenuHeaderView(MenuViewModel viewModel) : super(viewModel);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Container(alignment: Alignment.centerLeft,
        width: 24,
        height: 24,
        child: Image.asset("images/country_active.png")),
      Expanded(
          child: Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  $.watchFor<AsyncSnapshot<String>>(#title,
                      builder: $.builder1((title) => titleTextWidget(
                          title.data, FlexFit.loose, TextOverflow.ellipsis))),
                  /* $.watchFor<String>(#subTitle,
                      builder: $.builder1((subTitle) => subTitleTextWidget(
                          subTitle, FlexFit.loose, TextOverflow.ellipsis)))*/
                ],
              )))
    ]));
  }
}
