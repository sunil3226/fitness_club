import 'package:fitness_club/controller/water_intake_controller.dart';
import 'package:get/get.dart';

class WaterIntakeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WaterIntakeController());
  }
}