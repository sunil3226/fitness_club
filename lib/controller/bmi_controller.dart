import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BMIController extends GetxController {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  RxDouble? bmiResult = RxDouble(0);

  static const String _keyHeight = 'bmi_height';
  static const String _keyWeight = 'bmi_weight';
  static const String _keyResult = 'bmi_result';

  @override
  void onInit() {
    super.onInit();
    loadBMIData();
  }

  void calculateBMI() {
    final double? height = double.tryParse(heightController.text);
    final double? weight = double.tryParse(weightController.text);

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      Get.snackbar(
        'Error',
        'errorInvalidInput'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final heightInMeters = height / 100;
    final bmi = weight / (heightInMeters * heightInMeters);

    bmiResult?.value = bmi;
    saveBMIData(); // Save after calculation
  }

  Future<void> loadBMIData() async {
    final prefs = await SharedPreferences.getInstance();
    final height = prefs.getDouble(_keyHeight) ?? 0.0;
    final weight = prefs.getDouble(_keyWeight) ?? 0.0;
    final bmi = prefs.getDouble(_keyResult) ?? 0.0;

    if (height > 0) heightController.text = height.toString();
    if (weight > 0) weightController.text = weight.toString();
    bmiResult?.value = bmi;
  }

  Future<void> saveBMIData() async {
    final prefs = await SharedPreferences.getInstance();
    final height = double.tryParse(heightController.text) ?? 0.0;
    final weight = double.tryParse(weightController.text) ?? 0.0;

    await prefs.setDouble(_keyHeight, height);
    await prefs.setDouble(_keyWeight, weight);
    await prefs.setDouble(_keyResult, bmiResult?.value ?? 0.0);
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) return "categoryUnderweight".tr;
    if (bmi < 25) return "categoryNormalWeight".tr;
    if (bmi < 30) return "categoryOverweight".tr;
    return "categoryObesity".tr;
  }

  @override
  void onClose() {
    heightController.dispose();
    weightController.dispose();
    super.onClose();
  }
}
