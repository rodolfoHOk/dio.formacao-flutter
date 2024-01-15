import 'package:mobx/mobx.dart';

// Include generated file
part 'counter_mobx_store.g.dart';

// This is the class used by rest of your codebase
class CounterMobXStore = CounterMobXStoreBase with _$CounterMobXStore;

// The store-class
abstract class CounterMobXStoreBase with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}
