import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/patient/doctor_list.dart';
import 'package:online_doctor_appointment_system_frontend/patient/patient_home.dart';

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Role")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("I'm a Patient"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => PatientHome()));
              },
            ),
            SizedBox(width: 20),
            ElevatedButton(
              child: Text("I'm a Doctor"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DoctorList()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
