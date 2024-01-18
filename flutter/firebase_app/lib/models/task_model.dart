// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String _description = "";
  bool _completed = false;
  DateTime _createdAt = DateTime.now();
  DateTime _updatedAt = DateTime.now();
  String _userId = "";

  TaskModel(this._description, this._completed, this._userId);

  String get description => _description;
  set description(String description) => _description = description;
  bool get completed => _completed;
  set completed(bool completed) => _completed = completed;
  DateTime get createdAt => _createdAt;
  set createdAt(DateTime dateTime) => _createdAt = dateTime;
  DateTime get updatedAt => _updatedAt;
  set updatedAt(DateTime dateTime) => _updatedAt = dateTime;
  String get userId => _userId;
  set userId(String id) => _userId = id;

  TaskModel.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
    _completed = json['completed'];
    _createdAt = (json['created_at'] as Timestamp).toDate();
    _updatedAt = (json['updated_at'] as Timestamp).toDate();
    _userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = _description;
    data['completed'] = _completed;
    data['created_at'] = Timestamp.fromDate(_createdAt);
    data['updated_at'] = Timestamp.fromDate(_updatedAt);
    data['user_id'] = _userId;
    return data;
  }
}
