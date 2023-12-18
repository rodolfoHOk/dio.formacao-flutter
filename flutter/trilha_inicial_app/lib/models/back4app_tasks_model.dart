// ignore_for_file: unnecessary_getters_setters

class Back4AppTasksModel {
  List<Back4AppTaskModel> _tasks = [];

  Back4AppTasksModel({List<Back4AppTaskModel>? results}) {
    if (results != null) {
      _tasks = results;
    }
  }

  List<Back4AppTaskModel> get results => _tasks;
  set results(List<Back4AppTaskModel> results) => _tasks = results;

  Back4AppTasksModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _tasks = <Back4AppTaskModel>[];
      json['results'].forEach((v) {
        _tasks.add(Back4AppTaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = _tasks.map((v) => v.toJson()).toList();
    return data;
  }
}

class Back4AppTaskModel {
  String _objectId = "";
  String _description = "";
  bool _completed = false;
  String _createdAt = "";
  String _updatedAt = "";

  Back4AppTaskModel(this._objectId, this._description, this._completed,
      this._createdAt, this._updatedAt);

  String get objectId => _objectId;
  set objectId(String objectId) => _objectId = objectId;
  String get description => _description;
  set description(String description) => _description = description;
  bool get completed => _completed;
  set completed(bool completed) => _completed = completed;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  Back4AppTaskModel.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _description = json['description'];
    _completed = json['completed'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = _objectId;
    data['description'] = _description;
    data['completed'] = _completed;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    return data;
  }
}
