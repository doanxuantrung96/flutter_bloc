class DemoModel {
  String _title;
  int _id;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  DemoModel(this._id, this._title);

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'title': _title,
    };
  }
}
