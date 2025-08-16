import 'package:fitness_club/controller/bmi_controller.dart';
import 'package:get/get.dart';

class BMIBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BMIController());
  }
}