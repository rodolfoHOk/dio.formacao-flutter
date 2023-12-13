import 'package:trilha_inicial_app/models/task_sqlite_model.dart';
import 'package:trilha_inicial_app/repositories/sqlite/sqlite_database.dart';

class TaskSQLiteRepository {
  Future<List<TaskSQLiteModel>> getData() async {
    List<TaskSQLiteModel> tasks = [];
    var db = await SQLiteDatabase.getDatabase();
    var result =
        await db.rawQuery('''SELECT id, description, completed FROM tasks''');
    for (var element in result) {
      tasks.add(TaskSQLiteModel(
          int.tryParse(element['id'].toString()) ?? 0,
          element['description'].toString(),
          element['completed'].toString() == "1"));
    }
    return tasks;
  }

  Future<void> save(TaskSQLiteModel taskSQLiteModel) async {
    var db = await SQLiteDatabase.getDatabase();
    await db.rawInsert(
        '''INSERT INTO tasks (description, complete) VALUES (?,?)''',
        [taskSQLiteModel.description, taskSQLiteModel.completed]);
  }

  Future<void> update(TaskSQLiteModel taskSQLiteModel) async {
    var db = await SQLiteDatabase.getDatabase();
    await db.rawUpdate(
        '''UPDATE tasks SET description = ?, complete = ? WHERE id = ?''',
        [
          taskSQLiteModel.description,
          taskSQLiteModel.completed,
          taskSQLiteModel.id
        ]);
  }

  Future<void> delete(int id) async {
    var db = await SQLiteDatabase.getDatabase();
    await db.rawDelete('''DELETE tasks WHERE id = ?''', [id]);
  }
}
