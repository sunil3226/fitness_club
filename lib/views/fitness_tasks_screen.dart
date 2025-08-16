import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_club/routes/app_routes.dart';
import '../controller/workout_plan_controller.dart';
import '../data/services/local_storage_service.dart';

class FitnessTasksScreen extends StatefulWidget {
  @override
  State<FitnessTasksScreen> createState() => _FitnessTasksScreenState();
}

class _FitnessTasksScreenState extends State<FitnessTasksScreen> {
  final WorkoutPlanController controller = Get.find<WorkoutPlanController>();

  RxSet<String> completedTasks = <String>{}.obs;

  @override
  void initState() {
    super.initState();
    _loadCompletedTasks();
  }

  Future<void> _loadCompletedTasks() async {
    final storedTasks = await LocalStorageService.getCompletedWorkoutTasks();
    completedTasks.addAll(storedTasks);
  }

  void _toggleTask(String key, bool? value) {
    if (value == true) {
      completedTasks.add(key);
    } else {
      completedTasks.remove(key);
    }

    LocalStorageService.saveCompletedWorkoutTasks(completedTasks.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("weeklyFitnessTasks".tr)),
      body: Container(
        decoration: BoxDecoration(
          image: Theme.of(context).brightness == Brightness.light
              ? DecorationImage(
            image: AssetImage('assets/images/bg2.png'),
            fit: BoxFit.cover,
          )
              : null,
        ),
        child: Obx(() {
          return ListView(
            padding: EdgeInsets.all(16),
            children: controller.weeklyPlan.entries.expand((entry) {
              final day = entry.key;
              final workouts = entry.value;

              if (workouts.isEmpty) return <Widget>[];

              return [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    day.tr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...workouts.map((workout) {
                  final taskKey = "$day: $workout";
                  return Obx(() => CheckboxListTile(
                    title: Text(workout),
                    value: completedTasks.contains(taskKey),
                    onChanged: (bool? value) {
                      _toggleTask(taskKey, value);
                    },
                  ));
                }),
              ];
            }).toList()
              ..add(SizedBox(height: 32))
              ..add(ElevatedButton(
                onPressed: () => Get.toNamed(Routes.HOME),
                child: Text('buttonOk'.tr),
              ))
              ..add(SizedBox(height: 40)),
          );
        }),
      ),
    );
  }
}
