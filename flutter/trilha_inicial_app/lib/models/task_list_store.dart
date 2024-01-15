import 'package:mobx/mobx.dart';
import 'package:trilha_inicial_app/models/task_store.dart';

// Include generated file
part 'task_list_store.g.dart';

// This is the class used by rest of your codebase
class TaskListStore = TaskListMobXStoreBase with _$TaskListStore;

// The store-class
abstract class TaskListMobXStoreBase with Store {
  @observable
  ObservableList<TaskStore> tasks = ObservableList<TaskStore>();

  @computed
  List<TaskStore> getTasks() => justNotCompleted.value
      ? tasks.where((element) => element.completed == false).toList()
      : tasks.toList();

  @observable
  var justNotCompleted = Observable(false);

  @action
  void setJustNotCompleted(bool value) {
    justNotCompleted.value = value;
  }

  @action
  void add(String description) {
    tasks.add(TaskStore(description, false));
  }

  @action
  void update(String id, String description, bool completed) {
    var task = tasks.firstWhere((element) => element.id == id);
    task.update(description, completed);
  }

  @action
  void remove(String id) {
    tasks.removeWhere((element) => element.id == id);
  }
}
