import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutPlanController extends GetxController {
  final List<String> availableWorkouts = [
    'Push-ups',
    'Squats',
    'Lunges',
    'Plank',
    'Burpees',
    'Jumping Jacks',
    'Sit-ups',
    'Mountain Climbers',

    // Added muscle groups and exercises
    'Chest',
    'Triceps',
    'Biceps',
    'Shoulders',
    'Arms',
    'Abs',
    'Lats',
    'Legs',
    'Back',
    'Forearms',
    'Glutes',
    'Calves',

    'Bench Press',
    'Dumbbell Flyes',
    'Tricep Dips',
    'Overhead Tricep Extension',
    'Bicep Curls',
    'Hammer Curls',
    'Shoulder Press',
    'Lateral Raises',
    'Front Raises',
    'Crunches',
    'Russian Twists',
    'Pull-ups',
    'Lat Pulldown',
    'Leg Press',
    'Deadlifts',
    'Calf Raises',
    'Glute Bridges',
  ];

  RxMap<String, RxList<String>> weeklyPlan = {
    'Monday': <String>[].obs,
    'Tuesday': <String>[].obs,
    'Wednesday': <String>[].obs,
    'Thursday': <String>[].obs,
    'Friday': <String>[].obs,
    'Saturday': <String>[].obs,
    'Sunday': <String>[].obs,
  }.obs;

  var selectedWorkout = RxnString();
  var selectedDay = RxnString();

  static const _prefsKey = 'workout_plan';

  @override
  void onInit() {
    super.onInit();
    loadWeeklyPlan();
  }

  void setSelectedWorkout(String? workout) {
    selectedWorkout.value = workout;
  }

  void setSelectedDay(String? day) {
    selectedDay.value = day;
  }

  void addWorkoutToDay() {
    if (selectedWorkout.value != null && selectedDay.value != null) {
      final dayList = weeklyPlan[selectedDay.value!];
      if (dayList != null && !dayList.contains(selectedWorkout.value!)) {
        dayList.add(selectedWorkout.value!);
        saveWeeklyPlan();
      }
    }
  }

  void removeWorkout(String day, String workout) {
    final dayList = weeklyPlan[day];
    if (dayList != null) {
      dayList.remove(workout);
      saveWeeklyPlan();
    }
  }

  Future<void> saveWeeklyPlan() async {
    final prefs = await SharedPreferences.getInstance();
    // Convert RxMap<String, RxList<String>> to Map<String, List<String>>
    final simpleMap = weeklyPlan.map((key, value) => MapEntry(key, value.toList()));
    final jsonString = jsonEncode(simpleMap);
    await prefs.setString(_prefsKey, jsonString);
  }

  Future<void> loadWeeklyPlan() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_prefsKey);
    if (jsonString != null) {
      final Map<String, dynamic> decoded = jsonDecode(jsonString);
      decoded.forEach((key, value) {
        if (weeklyPlan.containsKey(key) && value is List) {
          weeklyPlan[key]!.assignAll(List<String>.from(value));
        }
      });
    }
  }
}
