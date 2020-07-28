import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Styles/TextStyle.dart';
import 'package:statistic_covid19/infrastructure/Utils/ColorsApp.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:statistic_covid19/viewModels/SelectCityViewModel.dart';

class SelectCityView extends BaseView<SelectCityViewModel> {
  SelectCityView(SelectCityViewModel model) : super(model);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => $Model.isBackNavigation,
        child: Scaffold(
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      automaticallyImplyLeading: $Model.isBackNavigation,
                      backgroundColor: ColorsApp.primaryColor,
                      title: Text(S.of(context).title_select_country),
                      actions: [
                        /*IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(this),
                            );
                          },
                        ),*/
                      ],
                    )
                  ];
                },
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: $.watchFor<AsyncSnapshot<List<Country>>>(
                              #items,
                              builder: $.builder1((items) => ListView(
                                  children: items.data
                                      ?.map((item) => Column(children: <Widget>[
                                            ListTile(
                                                title: Text(
                                                  '${item.country}',
                                                  style: TextStyleApp
                                                      .getStyleBlackText16(),
                                                ),
                                                onTap: () => $Model
                                                    .selectedCountry(item)),
                                          ]))
                                      ?.toList()))))
                    ]))));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  SelectCityView view;
  CustomSearchDelegate(this.view);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              S.of(context).search_result1,
            ),
          )
        ],
      );
    }

    if (!view.$Model.findCountry(query))
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              S.of(context).search_result2(query),
            ),
          )
        ],
      );

    return Expanded(
        child: ListView.builder(
      itemCount: view.$Model.findCountries.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${view.$Model.findCountries[index].country}',
              style: TextStyleApp.getStyleBlackText16()),
          onTap: () =>
              view.$Model.selectedCountry(view.$Model.findCountries[index]),
        );
      },
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
