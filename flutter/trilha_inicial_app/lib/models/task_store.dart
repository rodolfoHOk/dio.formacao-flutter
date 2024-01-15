import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'task_store.g.dart';

// This is the class used by rest of your codebase
class TaskStore = TaskMobXStoreBase with _$TaskStore;

// The store-class
abstract class TaskMobXStoreBase with Store {
  final String id = UniqueKey().toString();

  @observable
  String description = "";

  @observable
  bool completed = false;

  TaskMobXStoreBase(this.description, this.completed);

  @action
  void update(String description, bool completed) {
    this.description = description;
    this.completed = completed;
  }
}
