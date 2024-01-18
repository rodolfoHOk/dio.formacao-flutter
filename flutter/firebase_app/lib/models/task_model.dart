// ignore_for_file: unnecessary_getters_setters

class TaskModel {
  String _description = "";
  bool _completed = false;

  TaskModel(this._description, this._completed);

  String get description => _description;
  set description(String description) => _description = description;
  bool get completed => _completed;
  set completed(bool completed) => _completed = completed;

  TaskModel.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
    _completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = _description;
    data['completed'] = _completed;
    return data;
  }
}
