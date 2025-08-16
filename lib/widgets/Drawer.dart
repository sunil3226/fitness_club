import 'package:fitness_club/controller/profile_controller.dart';
import 'package:fitness_club/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Obx(
            () => Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.teal[700]!,
                    Colors.teal[300]!,
                    Colors.teal[700]!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: controller.imageFile.value != null
                        ? FileImage(controller.imageFile.value!)
                              as ImageProvider
                        : AssetImage("assets/images/default_avatar.png")
                              as ImageProvider,
                  ),
                  SizedBox(height: 16),
                  Text(
                    controller.userName.value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.monitor_weight_outlined),
            title: Text("checkYourBMI".tr),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Get.toNamed(Routes.BMI);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_drink),
            title: Text("waterIntakeTracker".tr),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Get.toNamed(Routes.WATERINTAKETRACHER);
            },
          ),
          ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text("workoutPlans".tr),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Get.toNamed(Routes.WORKOUTPLAN);
            },
          ),
          ListTile(
            leading: Icon(Icons.checklist),
            title: Text("weeklyFitnessTasks".tr),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Get.toNamed(Routes.FITNESSTASKS);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("profileSetting".tr),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Get.toNamed(Routes.PROFILE);
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("chooseLanguage".tr),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Get.toNamed(Routes.CHOOSELANGUAGE);
            },
          ),
        ],
      ),
    );
  }
}
