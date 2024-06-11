import 'package:flutter/material.dart';

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
          "Featured Products",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5.0),
        FeaturedProducts(),
        SizedBox(height: 10.0),
        Text(
          "Top Rated",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5.0),
      ],
    );
  }
}

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: const [
          Card(
            color: Colors.greenAccent,
            shadowColor: Color.fromARGB(255, 192, 151, 2),
            surfaceTintColor: Colors.deepOrangeAccent,
            child: _FeaturedCard(cardName: 'Elevated Card'),
          ),
          Card(
            color: Color.fromARGB(255, 8, 206, 91),
            shadowColor: Color.fromARGB(255, 2, 135, 197),
            surfaceTintColor: Colors.deepOrangeAccent,
            child: _FeaturedCard(cardName: 'Filled Card'),
          ),
          Card(
            color: Color.fromARGB(255, 22, 189, 0),
            shadowColor: Colors.amberAccent,
            surfaceTintColor: Colors.deepOrangeAccent,
            child: _FeaturedCard(cardName: 'Outlined Card'),
          ),
        ],
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 150,
      child: Center(child: Text(cardName)),
    );
  }
}
