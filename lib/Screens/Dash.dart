import 'package:flutter/material.dart';
import 'package:luxelooks/displays/maincard.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        Text(
          "Top Rated",
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(height: 5.0),
      ],
    );
  }
}
