import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/utilis/dummy_data.dart';

class MyAppointments extends StatelessWidget {
final appointments = DummyData.myAppointments;

  MyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Appointments")),
body: appointments.isEmpty
    ? Center(child: Text("No appointments yet"))
    : ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appt = appointments[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(appt["doctor"]!),
              subtitle: Text(
                "${appt["date"]} • ${appt["time"]}",
              ),
              trailing: Text(
                "Booked",
                style: TextStyle(color: Colors.green),
              ),
            ),
          );
        },
      ),
    );
  }
}
