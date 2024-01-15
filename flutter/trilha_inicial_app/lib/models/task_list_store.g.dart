// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListStore on TaskListMobXStoreBase, Store {
  late final _$tasksAtom =
      Atom(name: 'TaskListMobXStoreBase.tasks', context: context);

  @override
  ObservableList<TaskStore> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<TaskStore> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$justNotCompletedAtom =
      Atom(name: 'TaskListMobXStoreBase.justNotCompleted', context: context);

  @override
  Observable<bool> get justNotCompleted {
    _$justNotCompletedAtom.reportRead();
    return super.justNotCompleted;
  }

  @override
  set justNotCompleted(Observable<bool> value) {
    _$justNotCompletedAtom.reportWrite(value, super.justNotCompleted, () {
      super.justNotCompleted = value;
    });
  }

  late final _$TaskListMobXStoreBaseActionController =
      ActionController(name: 'TaskListMobXStoreBase', context: context);

  @override
  void setJustNotCompleted(bool value) {
    final _$actionInfo = _$TaskListMobXStoreBaseActionController.startAction(
        name: 'TaskListMobXStoreBase.setJustNotCompleted');
    try {
      return super.setJustNotCompleted(value);
    } finally {
      _$TaskListMobXStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(String description) {
    final _$actionInfo = _$TaskListMobXStoreBaseActionController.startAction(
        name: 'TaskListMobXStoreBase.add');
    try {
      return super.add(description);
    } finally {
      _$TaskListMobXStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(String id, String description, bool completed) {
    final _$actionInfo = _$TaskListMobXStoreBaseActionController.startAction(
        name: 'TaskListMobXStoreBase.update');
    try {
      return super.update(id, description, completed);
    } finally {
      _$TaskListMobXStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(String id) {
    final _$actionInfo = _$TaskListMobXStoreBaseActionController.startAction(
        name: 'TaskListMobXStoreBase.remove');
    try {
      return super.remove(id);
    } finally {
      _$TaskListMobXStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
justNotCompleted: ${justNotCompleted}
    ''';
  }
}
