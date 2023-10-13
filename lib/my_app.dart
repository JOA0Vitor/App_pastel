import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:trilhaapp/pages/home_page.dart';
import 'package:trilhaapp/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override //itens que ta na tela
  Widget build(BuildContext context) {
    return MaterialApp(
      //Tras varios itens
      debugShowCheckedModeBanner: false, //tirar a faixa de debug
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
        // ignore: deprecated_member_use
        errorColor: Colors.red,
      ),
      home: const LoginPage(),
    );
  }
}
