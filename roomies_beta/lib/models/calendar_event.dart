class CalendarEvent {
  String _user = '';
  DateTime _time = DateTime.now();
  String _eventName = '';
  String _importance = '';

  CalendarEvent(
      String user, DateTime time, String eventName, String importance) {
    _user = user;
    _time = time;
    _eventName = eventName;
    _importance = importance;
  }

  String get getUserId {
    return _user;
  }

  DateTime get getEventTime {
    return _time;
  }

  String get getEventName {
    return _eventName;
  }

  String get getImportance {
    return _importance;
  }

  void setUserId(String newUserId) {
    _user = newUserId;
  }

  void setEventTime(DateTime time) {
    _time = time;
  }

  void setEventName(String eventName) {
    _eventName = eventName;
  }

  void setImportance(String importance) {
    _importance = importance;
  }
}
