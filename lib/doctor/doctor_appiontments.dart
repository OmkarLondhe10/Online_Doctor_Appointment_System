import 'package:flutter/material.dart';

class DoctorAppointments extends StatelessWidget {
  final appointments = [
    {
      "patient": "Rahul",
      "time": "10:00 AM",
      "date": "28 Jan 2026"
    },
    {
      "patient": "Anita",
      "time": "2:00 PM",
      "date": "29 Jan 2026"
    },
  ];

  DoctorAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appointments")),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appt = appointments[index];
          return Card(
            child: ListTile(
              title: Text(appt["patient"]!),
              subtitle: Text("${appt["date"]} • ${appt["time"]}"),
              trailing: ElevatedButton(
                child: Text("Upload"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Upload Prescription")),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
