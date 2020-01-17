// base class for the different types of items within the list
abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class SettingItem {
  String title;

  SettingItem({this.title});
}
