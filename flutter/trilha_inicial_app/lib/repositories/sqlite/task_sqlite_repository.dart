import 'package:trilha_inicial_app/models/task_sqlite_model.dart';
import 'package:trilha_inicial_app/repositories/sqlite/sqlite_database.dart';

class TaskSQLiteRepository {
  Future<List<TaskSQLiteModel>> getData(bool justNotCompleted) async {
    List<TaskSQLiteModel> tasks = [];
    var db = await SQLiteDatabase.getDatabase();
    var result = await db.rawQuery(justNotCompleted
        ? '''SELECT id, description, completed FROM tasks WHERE completed = 0'''
        : '''SELECT id, description, completed FROM tasks''');
    for (var element in result) {
      tasks.add(TaskSQLiteModel(
          int.tryParse(element['id'].toString()) ?? 0,
          element['description'].toString(),
          int.tryParse(element['completed'].toString()) == 1));
    }
    return tasks;
  }

  Future<void> save(TaskSQLiteModel taskSQLiteModel) async {
    var db = await SQLiteDatabase.getDatabase();
    await db.rawInsert(
        '''INSERT INTO tasks (description, completed) VALUES (?,?)''',
        [taskSQLiteModel.description, taskSQLiteModel.completed]);
  }

  Future<void> update(TaskSQLiteModel taskSQLiteModel) async {
    var db = await SQLiteDatabase.getDatabase();
    await db.rawUpdate(
        '''UPDATE tasks SET description = ?, completed = ? WHERE id = ?''',
        [
          taskSQLiteModel.description,
          taskSQLiteModel.completed,
          taskSQLiteModel.id
        ]);
  }

  Future<void> delete(int id) async {
    var db = await SQLiteDatabase.getDatabase();
    await db.rawDelete('''DELETE FROM tasks WHERE id = ?''', [id]);
  }
}
