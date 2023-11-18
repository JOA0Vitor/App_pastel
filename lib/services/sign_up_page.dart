import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trilhaapp/widgets/routes.dart';

class SignUpservice {
  signUp(String email, String password) async {
    Uri uri = Uri.https(Routes.urlSignUp, "/");
    http.Response response = await http.post(
        ////////////////////////////////
        uri,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    print(response.body);
  }
}
