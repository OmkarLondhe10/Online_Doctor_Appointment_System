import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/patient/doctor_list.dart';
import 'package:online_doctor_appointment_system_frontend/patient/my_appiontments.dart';
import 'package:online_doctor_appointment_system_frontend/profile/patient_profile.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Dashboard'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Book Appiontment'),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (_)=> DoctorList())
              );
            },
          ),
          ListTile(
            title: Text('My Appiontments'),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (_)=> MyAppointments())
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> PatientProfile()));
            },
          )
        ],
      ),
    );
  }
}