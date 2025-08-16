import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var userName = 'user'.obs;
  var imageFile = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  static const String _keyName = 'user_name';
  static const String _keyImagePath = 'profile_image_path';

  @override
  void onInit() {
    super.onInit();
    loadProfileData();
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
      saveProfileData(); // Save after image change
    }
  }

  void updateName(String name) {
    userName.value = name;
    saveProfileData(); // Save after name change
  }

  Future<void> loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString(_keyName) ?? 'user';

    final imagePath = prefs.getString(_keyImagePath);
    if (imagePath != null && File(imagePath).existsSync()) {
      imageFile.value = File(imagePath);
    }
  }

  Future<void> saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, userName.value);
    if (imageFile.value != null) {
      await prefs.setString(_keyImagePath, imageFile.value!.path);
    }
  }
}
