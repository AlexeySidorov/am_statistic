class MenuModel {
  String title;
  String iconUrl;
  MenuType type;

  MenuModel(this.title, this.iconUrl, this.type);
}

enum MenuType { none, country, logout, pay, symptoms }
