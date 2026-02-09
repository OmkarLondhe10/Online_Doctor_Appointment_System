import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/patient/book_slot.dart';
import 'package:online_doctor_appointment_system_frontend/profile/patient_profile.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  Widget buildCard(BuildContext context, IconData icon, String title, Widget page) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title, 
        style: TextStyle(
          fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=> page)
          );
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Dashboard"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
      child: Column(
        children: [
          buildCard(context, Icons.add_circle_outline, "Book Appointment", BookSlot()),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> PatientProfile()));
            },
          )
        ],
        ),
      ),
    );
  }
}