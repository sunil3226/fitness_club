import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // Profile
  static Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
  }

  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_name') ?? 'Sunil Rai';
  }

  static Future<void> saveUserImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_image', path);
  }

  static Future<String?> getUserImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_image');
  }

  // BMI
  static Future<void> saveLastBMI(double bmi) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('last_bmi', bmi);
  }

  static Future<double?> getLastBMI() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('last_bmi');
  }

  // Water Intake
  static Future<void> saveWaterIntake(int glasses) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('water_intake', glasses);
  }

  static Future<int> getWaterIntake() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('water_intake') ?? 0;
  }

  // Workout Plan
  static Future<void> saveWorkoutPlan(Map<String, List<String>> plan) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(plan);
    await prefs.setString('workout_plan', encoded);
  }

  static Future<Map<String, List<String>>> getWorkoutPlan() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('workout_plan');
    if (jsonString == null) return {};
    final Map<String, dynamic> decoded = jsonDecode(jsonString);
    return decoded.map((day, workouts) {
      return MapEntry(day, List<String>.from(workouts));
    });
  }

  // Completed Tasks
  static Future<void> saveCompletedWorkoutTasks(List<String> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('completed_workout_tasks', tasks);
  }

  static Future<List<String>> getCompletedWorkoutTasks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('completed_workout_tasks') ?? [];
  }

}
