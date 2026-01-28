import 'package:flutter/material.dart';

class BookSlot extends StatelessWidget {
  final slots = ["10:00 AM", "11:00 Am", "2:00 PM"];
  BookSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Time Slot'),
      ),
      body: ListView(
        children: 
          slots.map((slot){
            return ListTile(
              title: Text(slot),
              trailing: ElevatedButton(
                child: Text('Book'),
                onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:Text('Appointment Booked')),
                  );
                },
              ),
            );
          }
        ).toList(),
      ),
    );
  }
}