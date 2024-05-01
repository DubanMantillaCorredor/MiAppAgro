import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseAPI {
  static String base = "https://mi-app-agro-f8ace816d05c.herokuapp.com";
  var authPath = base + "/signup";

  Future<http.Response> post(String path, String data) async {
    var url = Uri.parse(base + path);
    try {
      var response = await http
          .post(url, body: data, headers: {"Content-Type": "text/plain"});

      if (response.statusCode == 200) {
        // Procesa la respuesta exitosa aquí
        return response;
      } else {
        // Maneja errores o respuestas no exitosas
        throw Exception(
            'Error en la solicitud: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    }
  }
}

class RegisAPI {
  Future<http.Response> signUp(String email, String password) async {
    try {
      final data = jsonEncode({
        "user": {
          "email": email,
          "password": password,
        }
      });

      return await BaseAPI().post(BaseAPI().authPath, data);
    } catch (e) {
      print('Error en el registro: $e');
      rethrow;
    }
  }
}
