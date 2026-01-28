import 'package:flutter/material.dart';

class MyAppointments extends StatelessWidget {
  final appointments = [
    {
      "doctor": "Dr.",
      "time": "10:00 AM",
      "date": "28 Jan 2026",
      "status": "Booked"
    },
    {
      "doctor": "Dr. Patil",
      "time": "2:00 PM",
      "date": "29 Jan 2026",
      "status": "Completed"
    },
  ];

  MyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Appointments")),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(appointment["doctor"]!),
              subtitle: Text("${appointment["date"]} • ${appointment["time"]}"),
              trailing: Text(appointment["status"]!,
                  style: TextStyle(
                    color: appointment["status"] == "Booked"
                        ? Colors.orange
                        : Colors.green,
                  )),
            ),
          );
        },
      ),
    );
  }
}
