import 'package:resumestudio/app/app.dart';
import 'package:resumestudio/bootstrap.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final preferences = await SharedPreferences.getInstance();
  await bootstrap(
    () => App(
      preferences: preferences,
    ),
  );
}
