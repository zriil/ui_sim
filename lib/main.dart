import 'package:flutter/material.dart';
import 'package:moch_s_application/presentation/sim_login_screen/sim_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIM UNUGIRI',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: SimLoginScreen(), // Pastikan class ini benar dan terimport
    );
  }
}
