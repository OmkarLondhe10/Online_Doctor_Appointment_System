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

  final List<Map<String, dynamic>> slots = [];

  bool isEndAfterStart(TimeOfDay start, TimeOfDay end) {
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    return endMinutes > startMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Time Slot')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Select Date
            ElevatedButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (date != null) {
                  setState(() => selectedDate = date);
                }
              },
              child: Text(
                selectedDate == null
                    ? "Select Date"
                    : "Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              ),
            ),

            const SizedBox(height: 10),

            // Start Time
            ElevatedButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() => startTime = time);
                }
              },
              child: Text(
                startTime == null
                    ? "Select Start Time"
                    : "Start: ${startTime!.format(context)}",
              ),
            ),

            const SizedBox(height: 10),

            // End Time
            ElevatedButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() => endTime = time);
                }
              },
              child: Text(
                endTime == null
                    ? "Select End Time"
                    : "End: ${endTime!.format(context)}",
              ),
            ),

            const SizedBox(height: 16),

            // Add Slot Button
            ElevatedButton(
              onPressed: () {
                if (selectedDate == null ||
                    startTime == null ||
                    endTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Select all fields")),
                  );
                  return;
                }

                if (!isEndAfterStart(startTime!, endTime!)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("End time must be after start time")),
                  );
                  return;
                }

                setState(() {
                  slots.add({
                    "date": selectedDate,
                    "start": startTime,
                    "end": endTime,
                  });
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Slot Added")),
                );
              },
              child: const Text("Add Slot"),
            ),

            const SizedBox(height: 20),

            // Slot Cards
            Expanded(
              child: slots.isEmpty
                  ? const Center(child: Text("No slots added"))
                  : ListView.builder(
                      itemCount: slots.length,
                      itemBuilder: (context, index) {
                        final slot = slots[index];
                        final date = slot["date"] as DateTime;
                        final start = slot["start"] as TimeOfDay;
                        final end = slot["end"] as TimeOfDay;

                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: const Icon(Icons.schedule),
                            title: Text(
                                "${start.format(context)} - ${end.format(context)}"),
                            subtitle: Text(
                                "${date.day}/${date.month}/${date.year}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() => slots.removeAt(index));
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
