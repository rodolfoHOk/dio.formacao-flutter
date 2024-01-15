// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on TaskMobXStoreBase, Store {
  late final _$descriptionAtom =
      Atom(name: 'TaskMobXStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$completedAtom =
      Atom(name: 'TaskMobXStoreBase.completed', context: context);

  @override
  bool get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(bool value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  late final _$TaskMobXStoreBaseActionController =
      ActionController(name: 'TaskMobXStoreBase', context: context);

  @override
  void update(String description, bool completed) {
    final _$actionInfo = _$TaskMobXStoreBaseActionController.startAction(
        name: 'TaskMobXStoreBase.update');
    try {
      return super.update(description, completed);
    } finally {
      _$TaskMobXStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
completed: ${completed}
    ''';
  }
}
