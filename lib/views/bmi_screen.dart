import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bmi_controller.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bmiController = Get.find<BMIController>();

    return Scaffold(
      appBar: AppBar(title: Text("checkYourBMI".tr)),
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
          padding: EdgeInsets.only(left: 16, right: 16, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: bmiController.heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'labelHeight'.tr,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: bmiController.weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'labelWeight'.tr,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: bmiController.calculateBMI,
                child: Text('buttonCalculateBMI'.tr),
              ),
              SizedBox(height: 24),
              Obx(() {
                if (bmiController.bmiResult == null ||
                    bmiController.bmiResult?.value == 0) {
                  return SizedBox.shrink();
                }
                return Column(
                  children: [
                    Text(
                      '${"bmiResultPrefix".tr} ${bmiController.bmiResult!.value.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      bmiController.getBMICategory(
                        bmiController.bmiResult!.value,
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
