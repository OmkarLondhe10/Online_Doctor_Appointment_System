import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<RegisterScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String role = "Doctor";

  void signup() {
    final name = namecontroller.text.trim();
    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all the fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Signup successful! Please login"),
        backgroundColor: Colors.green,
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namecontroller,
              decoration: const InputDecoration(labelText: "Full Name"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: emailcontroller,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: passwordcontroller,
              decoration: const InputDecoration(labelText: "Password"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(labelText: "Confirm password"),
            ),

            Column(
              children: [
                RadioListTile(
                  title: const Text("Doctor"),
                  value: "doctor",
                  groupValue: role,
                  onChanged: (value) {
                    setState(() {
                      role = value!;
                    });
                  },
                ),
              ],
            ),

            Column(
              children: [
                RadioListTile(
                  title: const Text("Patient"),
                  value: "patient",
                  groupValue: role,
                  onChanged: (value) {
                    setState(() {
                      role = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            ElevatedButton(onPressed: signup, child: const Text("Signup")),
          ],
        ),
      ),
    );
  }
}
