import 'package:flutter/material.dart';
import 'home.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}