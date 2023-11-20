import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trilhaapp/widgets/routes.dart';

class LoginService {
  Future<bool> login(String email, String password) async {
    try {
      http.Response response = await http.post(Uri.parse(Routes.login),
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true,
          }));

      // Verifica se a resposta tem um código de sucesso (2xx)
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        // Aqui você pode adicionar lógica para lidar com respostas de erro.
        // Retorna false para indicar que o login falhou.
        return false;
      }
    } catch (e) {
      print('Erro durante o login: $e');
      return false;
    }
  }
}
