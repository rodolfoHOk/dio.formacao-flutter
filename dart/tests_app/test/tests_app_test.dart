import 'package:tests_app/tests_app.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('calculate1', () {
    expect(calculate(), greaterThan(41));
  });
}
