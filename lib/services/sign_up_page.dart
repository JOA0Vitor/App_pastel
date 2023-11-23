import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trilhaapp/widgets/routes.dart';

class SignUpService {
  signUp(String username, String email, String password) async {
    http.Response response = await http.post(Uri.parse(Routes.signUp),
        body: json.encode({
          "username": username,
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    print(response.body);
  }
}
