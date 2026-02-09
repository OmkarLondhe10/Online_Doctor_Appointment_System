import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/doctor/create_slot.dart';
import 'package:online_doctor_appointment_system_frontend/doctor/doctor_appiontments.dart';
import 'package:online_doctor_appointment_system_frontend/profile/doctor_profile.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});


  Widget buildCard(BuildContext context, IconData icon, String title, Widget page){
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title, 
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=> page));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Dashboard'),
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          buildCard(context, Icons.schedule, "Create Slot", CreateSlot()),
          buildCard(context, Icons.list_alt, "View Appointments", DoctorAppointments()),
          buildCard(context, Icons.person, "Profile", DoctorProfile()),
        ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> DoctorProfile())
                );
              },
            )
          ],
        ),
      ),
    );  
  }
}