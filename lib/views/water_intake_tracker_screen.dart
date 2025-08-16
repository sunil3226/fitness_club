import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/water_intake_controller.dart';

class WaterIntakeTrackerScreen extends StatelessWidget {
  WaterIntakeTrackerScreen({Key? key}) : super(key: key);

  final WaterIntakeController controller = Get.find<WaterIntakeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("waterIntakeTracker".tr)),
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
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'labelDailyGoal'.trParams({'goal': '${controller.goal}'}),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 24),
              Obx(() {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: controller.progress,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                      ),
                    ),
                    Text(
                      'labelProgress'.trParams({
                        'current': '${controller.glassesDrunk.value}',
                        'goal': '${controller.goal}',
                      }),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.decrement,
                    child: Icon(Icons.remove),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                  SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: controller.increment,
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
