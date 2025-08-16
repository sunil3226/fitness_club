import 'package:fitness_club/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/Drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appBarTitle".tr), // Fitness Club
      ),
      drawer: CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: Theme.of(context).brightness == Brightness.light
              ? DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Center(
          child: Column(
            spacing: 32,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.BMI);
                  },
                  style: customButtonStyle(),
                  child: Text("checkYourBMI".tr),
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.WATERINTAKETRACHER);
                  },
                  style: customButtonStyle(),
                  child: Text("waterIntakeTracker".tr),
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.WORKOUTPLAN);
                  },
                  style: customButtonStyle(),
                  child: Text("workoutPlans".tr),
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.FITNESSTASKS);
                  },
                  style: customButtonStyle(),
                  child: Text("weeklyFitnessTasks".tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  ButtonStyle customButtonStyle() {
    return ElevatedButton.styleFrom(
      elevation: 12,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
