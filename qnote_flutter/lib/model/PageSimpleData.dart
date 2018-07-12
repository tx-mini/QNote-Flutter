class PageSimpleDate {
  String _name;
  DateTime _dateTime;

  PageSimpleDate(this._name, this._dateTime);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;
  }
}
