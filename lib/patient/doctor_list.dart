import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/patient/book_slot.dart';

class DoctorList extends StatelessWidget {
  DoctorList({super.key});
  final doctors = ["Dr. Sharma", "Dr. Patil", "Dr. Mehta"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(doctors[index]),
              subtitle: Text('Cardiologist'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> BookSlot()));
              },
            ),
          );
        },
      ),
    );
  }
}