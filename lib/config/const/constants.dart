class Constants {
  static const String somethingWentWrong =
      "Something went wrong.\n Please try again!";
  static const String TABLEVIEW = "Table";
  static const String CARDVIEW = "Card";
  List<String> viewMode = [TABLEVIEW, CARDVIEW];
}

enum ViewMode { tableView, cardview }
