import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.person_add, size: 80),
            const SizedBox(height: 20),

          TextField(
            controller: namecontroller,
            decoration: const InputDecoration(
              labelText: "Full Name",
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),

        const SizedBox(height: 20),

        TextField(
          controller: emailcontroller,
          decoration: const InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

        TextField(
          controller: passwordcontroller,
          decoration: const InputDecoration(
            labelText: "Password",
            prefixIcon: Icon(Icons.password),
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

        TextField(
          controller: confirmPasswordController,
          decoration: const InputDecoration(
            labelText: "Confirm Passwod",
            prefixIcon: Icon(Icons.password),
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

          Card(
            elevation: 2,
            child: Column(
              children: [
                const ListTile(
                  title: Text("Select Role",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

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

            SizedBox(height: 10),

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
          ),

          SizedBox(height: 20),

          ElevatedButton(onPressed: signup, child: const Text("Signup",style: TextStyle(fontSize: 16)
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Alredy Registered?"),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> LoginScreen()));
                }, child: const Text("Login",style: TextStyle(fontWeight: FontWeight.bold)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
