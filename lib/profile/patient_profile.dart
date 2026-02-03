import 'package:flutter/material.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 45,
            child: Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 20),

          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Name"),
            subtitle: Text("Rahul"),
          ),

          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Email"),
            subtitle: Text("rahul@gmail.com"),
          ),

          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Role"),
            subtitle: Text("Patient"),
          ),

          const Spacer(),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: (){
            Navigator.popUntil(context, (route)=> route.isFirst);
            }, 
          icon: const Icon(Icons.logout),
          label: const Text("Logut")
            ),
          ],
        ),
      ),
    );
  }
}