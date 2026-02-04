import 'package:flutter/material.dart';
import '../utilis/dummy_data.dart';

class UploadPrescription extends StatelessWidget {
  final String appointmentId;

  const UploadPrescription({super.key, required this.appointmentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Prescription")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.description, size: 80),
            const SizedBox(height: 20),
            const Text("Select prescription file (PDF/Image)"),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              label: const Text("Choose File"),
              onPressed: () {

                DummyData.prescriptions[appointmentId] = "prescription.pdf";

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Prescription uploaded")),
                );

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
