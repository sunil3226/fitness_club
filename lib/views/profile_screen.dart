import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = controller.userName.value;

    return Scaffold(
      appBar: AppBar(title: Text("profile".tr)),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: Theme.of(context).brightness == Brightness.light
              ? DecorationImage(
                  image: AssetImage('assets/images/bg2.png'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => GestureDetector(
                onTap: controller.pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: controller.imageFile.value != null
                      ? FileImage(controller.imageFile.value!)
                      : AssetImage("assets/images/default_avatar.png")
                            as ImageProvider,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "yourName".tr,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.updateName(nameController.text.trim());
                Get.back();
              },
              child: Text("save".tr),
            ),
          ],
        ),
      ),
    );
  }
}
