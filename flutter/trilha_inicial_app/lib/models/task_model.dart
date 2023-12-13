import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String id = UniqueKey().toString();

  @HiveField(1)
  String description = "";

  @HiveField(2)
  bool completed = false;

  TaskModel();

  TaskModel.create(this.description, this.completed);
}
