class BottomBarItemModel {
  String title;
  String selectIconUrl;
  String unselectIconUrl;
  BottomBarItemType type;

  BottomBarItemModel(this.title, this.unselectIconUrl, this.selectIconUrl, this.type);
}

enum BottomBarItemType { world, statistic, report, none }
