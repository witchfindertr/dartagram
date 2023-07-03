import 'package:dartagram/dartagram.dart';

Future<void> main() async {
  // var user = await User.fromUsername('the_holy_crusader');
  var user = await FakeUser.fromUsername('the_holy_crusader');
  print(user);
}
