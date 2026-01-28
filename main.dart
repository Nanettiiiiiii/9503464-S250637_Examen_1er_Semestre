import 'package:nanao/student.details.dart';
import 'package:flutter/material.dart';
import 'package:nanao/student.list.dart';
import 'package:nanao/loading.page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon App étudiants',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const Studentlist(),
    );
  }
}

