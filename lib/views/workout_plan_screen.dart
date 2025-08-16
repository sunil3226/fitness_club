import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/workout_plan_controller.dart';

class WorkoutPlanScreen extends StatelessWidget {
  WorkoutPlanScreen({Key? key}) : super(key: key);

  final WorkoutPlanController controller = Get.find<WorkoutPlanController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("workoutPlans".tr)),
      body: Container(
        decoration: BoxDecoration(
          image: Theme.of(context).brightness == Brightness.light
              ? DecorationImage(
                  image: AssetImage('assets/images/bg2.png'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Obx(
                () => DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'labelChooseWorkout'.tr,
                    border: OutlineInputBorder(),
                  ),
                  value: controller.selectedWorkout.value,
                  items: controller.availableWorkouts.map((workout) {
                    return DropdownMenuItem(
                      value: workout,
                      child: Text(workout.tr),
                    );
                  }).toList(),
                  onChanged: controller.setSelectedWorkout,
                ),
              ),
              SizedBox(height: 16),
              Obx(
                () => DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'labelChooseDay'.tr,
                    border: OutlineInputBorder(),
                  ),
                  value: controller.selectedDay.value,
                  items: controller.weeklyPlan.keys.map((day) {
                    return DropdownMenuItem(value: day, child: Text(day.tr));
                  }).toList(),
                  onChanged: controller.setSelectedDay,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.addWorkoutToDay,
                child: Text('btnAddToPlan'.tr),
              ),
              Divider(height: 32, thickness: 1),
              Text(
                'labelWeeklySchedule'.tr,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 12),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.weeklyPlan.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${entry.key.tr}:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (entry.value.isEmpty)
                          Text('msgNoWorkoutsAdded'.tr)
                        else
                          ...entry.value.map((workout) {
                            return ListTile(
                              title: Text(workout.tr),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => controller.removeWorkout(
                                  entry.key,
                                  workout,
                                ),
                              ),
                            );
                          }),
                        SizedBox(height: 12),
                      ],
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
