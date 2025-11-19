// controller/register.controller.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterController {
  final String url = "https://mediadwi.com/api/latihan/register-user";

  Future<Map<String, dynamic>> register({
    required String username,
    required String password,
    required String fullName,
    required String email,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          "username": username,
          "password": password,
          "full_name": fullName,
          "email": email,
        },
      );

      print("RAW RESPONSE: ${response.body}");

      final data = jsonDecode(response.body);

      return {
        "success": data["status"] == true,
        "message": data["message"] ?? "Tidak ada pesan dari server",
      };
    } catch (e) {
      print("ERROR: $e");
      return {"success": false, "message": "Terjadi kesalahan: $e"};
    }
  }
}
