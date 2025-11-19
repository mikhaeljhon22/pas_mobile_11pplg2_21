import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final String url = "https://mediadwi.com/api/latihan/login-user";

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"username": username, "password": password},
      );

      print("status code: ${response.statusCode}");
      print("response body: ${response.body}");

      try {
        final data = jsonDecode(response.body);
        print("json $data");

        if (data["status"] == true) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("token", data["token"]);

          return {
            "success": true,
            "message": data["message"] ?? "Login berhasil",
          };
        }

        return {"success": false, "message": data["message"] ?? "Login gagal"};
      } catch (e) {
        print("error decode json: $e");
        return {"success": false, "message": "Terjadi kesalahan decode JSON"};
      }
    } catch (e) {
      print("error koneksi: $e");
      return {"success": false, "message": "Terjadi kesalahan koneksi"};
    }
  }
}
