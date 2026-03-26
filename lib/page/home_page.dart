import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Welcome to Home Page "
          '${DateTime.now().toString()}',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
