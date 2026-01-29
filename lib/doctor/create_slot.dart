import 'package:flutter/material.dart';

class CreateSlot extends StatefulWidget {
  const CreateSlot({super.key});

  @override
  State<CreateSlot> createState() => _CreateSlotState();
}

class _CreateSlotState extends State<CreateSlot> {

  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Time Slot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Date (DD/MM/YYYY)"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "End Time"),
            ),

            SizedBox(height: 30),

            ElevatedButton(onPressed: () async {
              var selectedDate = await showDateRangePicker(
                context: context, 
                initialDate: DateTime.now(),
                firstDate: DateTime.now(), 
                lastDate: DateTime(2030),
            );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Slot Created')),
              );
            },
            child: Text('Add Slot')),
          ],
        ),
      ),
    );
  }
}