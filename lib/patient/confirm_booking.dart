import 'package:flutter/material.dart';

class ConfirmBooking extends StatelessWidget {
  final String slotDate;
  final String slotTime;
  const ConfirmBooking({super.key, required this.slotDate, required this.slotTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confrim Appointment"),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.check_circle, size: 80, color: Colors.green),
          const SizedBox(height: 20),

          Text('Appointment Details',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
          ),

        const SizedBox(height: 20),

        Card(
          child: ListTile(
            title: const Text("Date"),
            subtitle: Text(slotDate),
          ),
        ),
        const SizedBox(height: 30),

        ElevatedButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:Text("Appointment Booked")
            ));
          Navigator.pop(context);
        }, child: Text("Confirm Booking"))

        ],
      ),
      ),
    );
  }
}