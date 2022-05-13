import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Guard {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> login(String usuario, String senha) async {
    late Response response;
    try {
      response = await Dio().post('http://localhost:3001/authenticate',
          data: {"usuario": usuario, "senha": senha});
      if (response.data['token'] != null) {
        await storage.write(key: 'token', value: response.data['token']);
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<String?> getToken() {
    return storage.read(key: 'token');
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
  }
}
