import 'package:flutter/material.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/Styles/TextStyle.dart';
import 'package:statistic_covid19/infrastructure/Utils/ColorsApp.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:statistic_covid19/viewModels/SymptomsViewModel.dart';

class SymptomsView extends BaseView<SymptomsViewModel> {
  SymptomsView(SymptomsViewModel model) : super(model);

  @override
  State<StatefulWidget> createState() {
    return _SymptomsViewState();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _SymptomsViewState extends State<SymptomsView> {
  _SymptomsViewState();
  bool visibleProgressBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorsApp.primaryColor,
            title: Text(S.of(context).symptoms)),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Center(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Text(S.of(context).symptoms_title,
                            style: TextStyleApp
                                .getTitleText16PrimaryColorStyle())))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(S.of(context).symptoms_sub_title1,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Text(S.of(context).symptoms_sub_title2,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_sub_item1,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_sub_item2,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_sub_item3,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_sub_item4,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_sub_item5,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_sub_item6,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_sub_item7,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_sub_item8,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Center(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Text(S.of(context).symptoms_measures_title,
                            style: TextStyleApp
                                .getTitleText16PrimaryColorStyle())))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_measures_sub_item1,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_measures_sub_item2,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_measures_sub_item3,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_measures_sub_item4,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_measures_sub_item5,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_measures_sub_item6,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(S.of(context).symptoms_measures_sub_item7,
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
          ],
        )));
  }
}
