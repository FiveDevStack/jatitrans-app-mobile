import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:jatitrans_app/Core/Utils/Parameters.dart';
import 'package:jatitrans_app/Repositories/Login/ViewDataModel/LoginDM.dart';

mixin CacheManager {
  final GetStorage storage = GetStorage();

  Future setLoginStatus(bool status) async {
    await storage.write(CacheManagerKey.loginStatus.name, status);
  }

  Future<bool> getLoginStatus() async {
    bool status = storage.read(CacheManagerKey.loginStatus.name) ?? false;
    return status;
  }

  Future setProcessStatus(bool status) async {
    await storage.write(CacheManagerKey.processStatus.name, status);
  }

  Future<bool> getProcessStatus() async {
    bool status = storage.read(CacheManagerKey.processStatus.name) ?? false;
    return status;
  }

  Future saveLoginData(LoginDM loginData) async {
    final toJson = jsonEncode(loginData.toJson());
    storage.write(CacheManagerKey.loginData.name, toJson);
  }

  Future<LoginDM> getLoginData() async {
    if (storage.hasData(CacheManagerKey.loginData.name)) {
      final data = storage.read(CacheManagerKey.loginData.name) ?? false;
      final json = jsonDecode(data);
      return LoginDM.fromJson(json);
    } else {
      return LoginDM();
    }
  }

  Future removeLoginData() async {
    storage.remove(CacheManagerKey.loginData.name);
  }
}
