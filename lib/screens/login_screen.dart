import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/screens/role_select_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(decoration: InputDecoration(labelText: "Email")),
          TextField(decoration: InputDecoration(labelText:"Password"),
          obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_)=> RoleSelectScreen()),
            );
          }, child: Text('Login'))
        ],
      ),
      ),
    );
  }
}