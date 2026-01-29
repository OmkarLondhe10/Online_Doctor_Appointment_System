import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/doctor/create_slot.dart';
import 'package:online_doctor_appointment_system_frontend/doctor/doctor_appiontments.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Dashboard'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Create Time Slot !'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> CreateSlot()));
            },
          ),
          ListTile(
            title: Text('View Appiontments'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> DoctorAppointments()));
            },
          )
        ],
      ),
    );
  }
}