import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/models/dados_usuario.dart';
import 'package:trilhaapp/pages/menu.dart';

class FlutterFireAuth {
  FlutterFireAuth(this._context);
  late final BuildContext _context;

  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;
  // User? userario;
  // bool isLoading = true;
  // AuthService() {
  //   _authCheck();
  // }

  // _authCheck() {
  //   _auth.authStateChanges().listen((User? user) {
  //     userario = (user == null) ? null : user;
  //     isLoading = false;
  //     // notifyListeners();
  //   });
  // }
  Future<DadosUsuario?> createUserWithEmailAndPassword(
      String username, String email, String password) async {
    try {
      // Verifica se o email contém ".com"
      if (!email.contains('.com' + '.co' + '.c')) {
        throw FirebaseAuthException(
          code: 'invalid-email',
          message: 'O email deve conter ".com"',
        );
      }

      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return DadosUsuario(name: username, email: email);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Ocorreu um Erro'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    return null;
  }

  // void loginWithEmailAndPassword() {}

  // void getLoggedInUser() {}
}
