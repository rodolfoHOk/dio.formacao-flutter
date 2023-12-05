import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _completed = false;

  Task(this._description, this._completed);

  String get id => _id;

  String get description => _description;

  bool get completed => _completed;

  set description(String description) {
    _description = description;
  }

  set completed(bool completed) {
    _completed = completed;
  }
}
