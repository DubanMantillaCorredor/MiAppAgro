import 'package:mi_agro_app/api/RegisAPI.dart'; 

Future<void> myFunction() async {
  final registerAPI = RegisterAPI(); // Instancia de la clase RegisterAPI
  const nombre = 'Daniel Garcia';
  const email = 'dg@gmail.com';
  const password = '123456';

  try {
    final response = await registerAPI.register(nombre, email, password);
    if (response.statusCode == 200) {
      print('Registro exitoso: ${response.body}');
      // Aquí puedes realizar acciones adicionales después del registro exitoso
    } else {
      print('Error en el registro: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error al realizar la solicitud: $e');
  }
}
