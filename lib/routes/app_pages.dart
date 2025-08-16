import 'package:fitness_club/binding/bmi_binding.dart';
import 'package:fitness_club/binding/profile_binding.dart';
import 'package:fitness_club/binding/water_intake_binding.dart';
import 'package:fitness_club/binding/workout_plan_binding.dart';
import 'package:fitness_club/routes/app_routes.dart';
import 'package:fitness_club/views/bmi_screen.dart';
import 'package:fitness_club/views/choose_language_screen.dart';
import 'package:fitness_club/views/fitness_tasks_screen.dart';
import 'package:fitness_club/views/profile_screen.dart';
import 'package:fitness_club/views/water_intake_tracker_screen.dart';
import 'package:fitness_club/views/workout_plan_screen.dart';
import 'package:get/get.dart';
import '../views/home_screen.dart';

class AppPages{
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomeScreen()),
    GetPage(name: Routes.PROFILE, page: () => ProfileScreen(), binding: ProfileBinding()),
    GetPage(name: Routes.BMI, page: () => BMIScreen(), binding: BMIBinding()),
    GetPage(name: Routes.FITNESSTASKS, page: () => FitnessTasksScreen(), binding: WorkoutPlanBinding()),
    GetPage(name: Routes.WATERINTAKETRACHER, page: () => WaterIntakeTrackerScreen(), binding: WaterIntakeBinding()),
    GetPage(name: Routes.WORKOUTPLAN, page: () => WorkoutPlanScreen(), binding: WorkoutPlanBinding()),
    GetPage(name: Routes.CHOOSELANGUAGE, page: () => ChooseLanguageScreen())
  ];
}