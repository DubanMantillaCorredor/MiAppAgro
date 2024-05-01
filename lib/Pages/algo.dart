import 'package:mi_agro_app/api/AuthAPI.dart'; // Asegúrate de importar el paquete necesario

Future<void> myFunction() async {
  final authAPI = AuthAPI(); // Instancia de la clase AuthAPI
  const email = 'frenando40@hotmail.com';
  const password = '123456';

  try {
    final response = await authAPI.login(email, password);
    if (response.statusCode == 200) {
      print('Inicio de sesión exitoso: ${response.body}');
      // Aquí puedes realizar acciones adicionales después del inicio de sesión exitoso
    } else {
      print('Error en el inicio de sesión: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error al realizar la solicitud: $e');
  }
}
