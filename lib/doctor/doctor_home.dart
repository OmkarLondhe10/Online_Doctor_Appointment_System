import 'package:flutter/material.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctor Dashboard")),
      body: Column(
        children: [
          ListTile(
            title: Text("Create Time Slots"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CreateSlot()));
            },
          ),
          ListTile(
            title: Text("View Appointments"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DoctorAppointments()));
            },
          ),
        ],
      ),
    );
  }
}
