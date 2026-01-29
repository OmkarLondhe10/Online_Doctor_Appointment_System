import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/screens/login_screen.dart';
import 'package:online_doctor_appointment_system_frontend/utilis/colors.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Appiontment',
      theme: ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: bgColor,
        ),
      home: LoginScreen(),
    );
  }
}