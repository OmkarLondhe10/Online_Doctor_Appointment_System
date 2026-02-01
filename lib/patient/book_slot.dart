import 'package:flutter/material.dart';
import 'package:online_doctor_appointment_system_frontend/patient/confirm_booking.dart';
import 'package:online_doctor_appointment_system_frontend/utilis/dummy_data.dart';

class BookSlot extends StatefulWidget {
  const BookSlot({super.key});

  @override
  State<BookSlot> createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlot> {
  final List<Map<String, dynamic>> slots = [
    {
      "date": "28/01/2026",
      "time": "10:00 AM - 10:30 AM",
      "available": true,
    },
    {
      "date": "28/01/2026",
      "time": "11:00 AM - 11:30 AM",
      "available": false,
    },
    {
      "date": "29/01/2026",
      "time": "02:00 PM - 02:30 PM",
      "available": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Slots")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: slots.length,
        itemBuilder: (context, index) {
          final slot = slots[index];
          final isAvailable = slot["available"] as bool;

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(
                Icons.schedule,
                color: isAvailable ? Colors.green : Colors.grey,
              ),
              title: Text(slot["time"] as String),
              subtitle: Text("Date: ${slot["date"]}"),
              trailing: ElevatedButton(
              onPressed: isAvailable
                  ? () {
                      setState(() {
                        slot["available"] = false;
                      });

                      DummyData.myAppointments.add({
                        "date": slot["date"],
                        "time": slot["time"],
                        "doctor": "Dr. Sharma",
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ConfirmBooking(
                            slotDate: slot["date"],
                            slotTime: slot["time"],
                          ),
                        ),
                      );
                    }
                  : null,
                child: const Text("Book"),
              ),
            ),
          );
        },
      ),
    );
  }
}
