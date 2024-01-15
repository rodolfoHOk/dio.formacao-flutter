import 'package:mobx/mobx.dart';

class CounterMobXService {
  final _counter = Observable(0);
  late Action increment;

  int get counter => _counter.value;

  set counter(int value) => _counter.value = value;

  void _increment() {
    _counter.value++;
  }

  CounterMobXService() {
    increment = Action(_increment);
  }
}
