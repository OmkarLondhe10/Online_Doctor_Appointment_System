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
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void _loginSubmitted() {
    final username = usernamecontroller.text.trim();
    final password = passwordcontroller.text.trim();  

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Enter Email and Password")),
      );
      return;
    }

    if (isPatient && username == 'patient' && password == '1234') {
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

    if (!isPatient && username == 'doctor' && password == '1234') {
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
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.login, size: 80),
            const SizedBox(height: 20),

            TextField(
              controller: usernamecontroller,
              decoration: const InputDecoration(
                labelText: "Username",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

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
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                _loginSubmitted();  // 👈 SAME LOGIC
              },
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup'); 
                    // OR use your existing navigation
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
