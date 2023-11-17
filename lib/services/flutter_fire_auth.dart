import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/models/dados_usuario.dart';

class FlutterFireAute {
  FlutterFireAute(this._context);

  late final BuildContext _context;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<DadosUsuario?> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return DadosUsuario(name: name, email: email);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Ocorreu um Error'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void loginWithEmailAndPassword() {}

  void getLoggedInUser() {}
}
