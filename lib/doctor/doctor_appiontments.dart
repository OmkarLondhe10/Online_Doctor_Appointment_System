import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/utilis/dummy_data.dart';


class DoctorAppointments extends StatelessWidget {
  const DoctorAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments = DummyData.doctorAppointments;

    return Scaffold(
      appBar: AppBar(title: const Text("Appointments")),
      body: appointments.isEmpty
          ? const Center(child: Text("No appointments yet"))
          : ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appt = appointments[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(appt["patient"]!),
                    subtitle: Text(
                      "${appt["date"]} • ${appt["time"]}",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
