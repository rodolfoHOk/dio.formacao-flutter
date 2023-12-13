// ignore_for_file: unnecessary_getters_setters

class TaskSQLiteModel {
  int _id = 0;
  String _description = "";
  bool _completed = false;

  TaskSQLiteModel.blank();

  TaskSQLiteModel(this._id, this._description, this._completed);

  int get id => _id;

  String get description => _description;

  bool get completed => _completed;

  set id(int id) {
    _id = id;
  }

  set description(String description) {
    _description = description;
  }

  set completed(bool completed) {
    _completed = completed;
  }
}
