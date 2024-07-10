import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPlugin {
  static Future<String> getDrawers() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('drawers') ?? '';
    } catch (error) {
      print("Error: Shared preferences plugin get drawers $error");
      return '';
    }
  }

  static Future<void> addDrawer(String drawerJson) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('drawers', drawerJson);
    } catch (error) {
      print("Error: Shared preferences plugin add drawer $error");
    }
  }
}
