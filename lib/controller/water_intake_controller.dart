import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterIntakeController extends GetxController {
  final int goal = 15;
  var glassesDrunk = 0.obs;

  static const String _prefsKey = 'water_intake_glasses';

  @override
  void onInit() {
    super.onInit();
    loadGlassesDrunk();
  }

  void increment() {
    if (glassesDrunk.value < goal) {
      glassesDrunk.value++;
      saveGlassesDrunk();
    }
  }

  void decrement() {
    if (glassesDrunk.value > 0) {
      glassesDrunk.value--;
      saveGlassesDrunk();
    }
  }

  double get progress => glassesDrunk.value / goal;

  Future<void> saveGlassesDrunk() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefsKey, glassesDrunk.value);
  }

  Future<void> loadGlassesDrunk() async {
    final prefs = await SharedPreferences.getInstance();
    glassesDrunk.value = prefs.getInt(_prefsKey) ?? 0;
  }
}
