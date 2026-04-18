import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData(Map<String, String> data) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("name", data["name"] ?? "");
  await prefs.setString("age", data["age"] ?? "");
}

Future<Map<String, String>> getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString("name");
  String? age = prefs.getString("age");
  return {"name": name ?? "", "age": age ?? ""};
}
