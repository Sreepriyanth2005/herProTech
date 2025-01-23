import 'dart:convert';

import 'package:herprotech/model/user_model.dart';
import 'package:herprotech/storage/storage_service.dart';

class StoreService {
  static Future<void> storeEmployeeData(UserModel employeeData) async {
    final jsonString = jsonEncode(employeeData.toJson());
    await SecureStorageService.write('user', jsonString);
  }

  static Future<UserModel> getEmployeeData() async {
    String? employeeDataJson = await SecureStorageService.read('user');
    if (employeeDataJson != null) {
      return UserModel.fromJson(jsonDecode(employeeDataJson));
    } else {
      throw Exception('No user data found');
    }
  }

  static Future<void> deleteAllData() async {
    await SecureStorageService.delete('user');
  }
}
