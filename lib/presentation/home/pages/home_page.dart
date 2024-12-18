import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Authenticated",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
