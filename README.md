# Dartagram 🦤
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/holy-crusader-py/dartagram/publish.yml?style=flat)
![Pub Version (including pre-releases)](https://img.shields.io/pub/v/dartagram?style=flat)
![Pub Points](https://img.shields.io/pub/points/dartagram?style=flat)
![GitHub top language](https://img.shields.io/github/languages/top/holy-crusader-py/dartagram?style=flat)

Dartagram (best name ever) is an Instagram wrapper that don't require Instagram API key to work. It'll provide a cache system to reduce API usage (but not currently available).

## Usage
### Basic usage
```dart
import 'package:dartagram/dartagram.dart';

Future<void> main() async {
  var user = await User.fromUsername('<username>');
  print(user);
}
```

You can test your code without using the Instagram API by using a fake user
```dart
import 'package:dartagram/dartagram.dart';

Future<void> main() async {
  // The <username> here is useless, you can replace it with anything you like
  var user = await FakeUser.fromUsername('<username>');
  print(user);
}
```

## License
Released under [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.en.html) license.