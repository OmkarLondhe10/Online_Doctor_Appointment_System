import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/screens/login_screen.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Profile')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              child: Icon(Icons.medical_services, size: 50),
            ),

            const SizedBox(height: 20),

            const ListTile(
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text("Dr. Patil"),
            ),

            ListTile(
              leading: Icon(Icons.work),
              title: Text('Work'),
              subtitle: Text('Cardiologist'),
            ),

            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text("Patil@doctor.com"),
            ),

            const Spacer(),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
              label: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
