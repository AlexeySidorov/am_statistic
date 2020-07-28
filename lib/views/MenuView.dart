import 'package:flutter/material.dart';
import 'package:statistic_covid19/infrastructure/Models/MenuModel.dart';
import 'package:statistic_covid19/infrastructure/Styles/TextStyle.dart';
import 'package:statistic_covid19/infrastructure/Utils/ColorsApp.dart';
import 'package:statistic_covid19/viewModels/MenuViewModel.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:statistic_covid19/views/UI/MenuHeaderView.dart';

class MenuView extends BaseView<MenuViewModel> {
  MenuView() : super(MenuViewModel());

  @override
  State<StatefulWidget> createState() {
    return _MenuViewState();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _MenuViewState extends State<MenuView> {
  _MenuViewState();

  @override
  void deactivate() {
    widget.$Model.deactive();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    widget.$Model.registryProperties(context);
    widget.$Model.init();
    var _ = Drawer(
        child: Column(children: <Widget>[
      Container(
          height: 100,
          child: DrawerHeader(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.fromLTRB(30, 10, 18, 10),
              child: MenuHeaderView(widget.$Model))),
      Divider(height: 1, color: ColorsApp.dividerColor),
      Expanded(
          child: widget.$.watchFor<AsyncSnapshot<List<MenuModel>>>(#items,
              builder: widget.$.builder1((items) => ListView(
                  children: items.data
                      ?.map((item) => Column(children: <Widget>[
                            ListTile(
                                leading: Container(
                                    child: Image.asset(item.iconUrl),
                                    width: 18,
                                    height: 18,
                                    margin: EdgeInsets.fromLTRB(20, 3, 0, 0)),
                                title: Text(
                                  '${item.title}',
                                  style: TextStyleApp.getStyleBlackText14(),
                                ),
                                onTap: () {
                                  if (Scaffold.of(context).isDrawerOpen)
                                    Scaffold.of(context).openEndDrawer();

                                  widget.$Model.selectedMenuItem(item);
                                }),
                            Container(
                                margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                                child: Divider(
                                    height: 1, color: ColorsApp.dividerColor))
                          ]))
                      ?.toList())))),
      Container(
          // This align moves the children to the bottom
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              // This container holds all the children that will be aligned
              // on the bottom and should not scroll with the above ListView
              child: Container(
                  child: Column(
                children: <Widget>[
                  Divider(height: 1, color: ColorsApp.dividerColor),
                  widget.$.watchFor<AsyncSnapshot<String>>(#version,
                      builder: widget.$.builder1((value) => ListTile(
                          title: Text(value.data,
                              style: TextStyleApp.getStyleBlackText12(),
                              overflow: TextOverflow.ellipsis))))
                ],
              ))))
    ]));

    widget.$Model.active();
    return _;
  }
}
