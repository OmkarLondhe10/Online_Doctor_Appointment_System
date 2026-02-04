import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/utilis/dummy_data.dart';
import 'upload_prescription.dart';

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
                index.toString();
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.person, size: 32),
                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appt["patient"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
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
                            ],
                          ),
                        ),

                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => UploadPrescription(
                                      appointmentId: index.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: const Text("Upload"),
                            ),
                            const SizedBox(height: 8),
                            OutlinedButton(
                              onPressed: () {
                              appt["status"] = "Completed";
                            (context as Element).markNeedsBuild();
                          },
                        child: const Text("Complete"),
                      ),
                    ],
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