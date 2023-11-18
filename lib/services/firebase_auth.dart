import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/models/dados_usuario.dart';

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
      String name, String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return DadosUsuario(name: name, email: email);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Ocorreu um Error'),
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
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
