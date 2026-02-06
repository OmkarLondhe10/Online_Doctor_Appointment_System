import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/doctor/doctor_home.dart';
import 'package:online_doctor_appointment_system_frontend/patient/patient_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPatient = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void _loginSubmitted() {
    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();  

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Enter Email and Password")),
      );
      return;
    }

    if (isPatient && email == 'patient' && password == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => PatientHome()),
      );
      return;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Invalid Username or Password')));
    }

    if (!isPatient && email == 'doctor' && password == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => DoctorHome()),
      );
      return;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Invalid Username or Password')));
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),

            SizedBox(height: 12),

            Row(
              children: [
                Checkbox(
                  value: isPatient,
                  onChanged: (val) {
                    setState(() => isPatient = val!);
                  },
                ),
                const Text("Login As a Patient"),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                _loginSubmitted();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
