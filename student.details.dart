import 'package:nanao/models/student.dart';
import 'package:flutter/material.dart';

class Studentdetails extends StatelessWidget {
  const Studentdetails({super.key, required this.student});
  final Student student;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(student.nom),
      ),
    );
  }
}