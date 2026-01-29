import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  
  final String name;
  final String spec;
  
  const DoctorCard({super.key, required this.name, required this.spec});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.person)),
        title: Text(name,style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(spec),
        trailing: Icon(Icons.arrow_forward_ios,size: 16),
      ),
    );
  }
}