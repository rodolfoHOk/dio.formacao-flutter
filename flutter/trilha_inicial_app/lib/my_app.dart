import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilha_inicial_app/pages/login_page.dart';
// import 'package:trilha_inicial_app/pages/old_login_page.dart';
// import 'package:trilha_inicial_app/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)),
      home: const LoginPage(),
    );
  }
}
