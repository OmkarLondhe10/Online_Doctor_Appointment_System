import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/utilis/dummy_data.dart';

class MyAppointments extends StatelessWidget {
  const MyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments = DummyData.patientAppointments;

    return Scaffold(
      appBar: AppBar(title: const Text("My Appointments")),
      body: appointments.isEmpty
          ? const Center(child: Text("No appointments yet"))
          : ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appt = appointments[index];
                final appointmentId = index.toString();

                final hasPrescription =
                    DummyData.prescriptions.containsKey(appointmentId);

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(appt["doctor"]!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${appt["date"]} • ${appt["time"]}"),
                        const SizedBox(height: 4),

                        Text(
                          "Status: ${appt["status"]}",
                          style: TextStyle(
                            color: appt["status"] == "Completed"
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),

                        if (hasPrescription)
                          TextButton.icon(
                            icon: const Icon(Icons.visibility),
                            label: const Text("View Prescription"),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Opening ${DummyData.prescriptions[appointmentId]}",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
