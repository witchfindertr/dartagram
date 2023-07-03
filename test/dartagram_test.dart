import 'package:dartagram/dartagram.dart';
import 'package:test/test.dart';

void main() {
  group('Main test', () {
    test('First Test', () {
      var user = FakeUser.fromUsername('the_holy_crusader');
      expect(user, isNotNull);
    });
  });
}
