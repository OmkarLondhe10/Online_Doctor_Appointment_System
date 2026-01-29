import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/patient/book_slot.dart';
import 'package:online_doctor_appointment_system_frontend/widgets/doctor_card.dart';

class DoctorList extends StatelessWidget {
  final doctors = [
    {"name": "Dr. Sharma", "spec": "Cardiologist"},
    {"name": "Dr. Patil", "spec": "Dermatologist"},
    {"name": "Dr. Mehta", "spec": "Neurologist"},
  ];

  DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctors")),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BookSlot()),
              );
            },
            child: DoctorCard(
              name: doctor["name"]!,
              spec: doctor["spec"]!, 
            ),
          );
        },
      ),
    );
  }
}
