import 'package:flutter/material.dart';
import 'package:luxelooks/Screens/Dash.dart';
import 'package:luxelooks/details/homepage.dart';
import 'package:luxelooks/drawers/mainpage_drawer.dart';
import 'package:luxelooks/models/Bookings.dart';
import 'package:luxelooks/models/History.dart';
import 'package:luxelooks/models/Notifications.dart';
import 'package:luxelooks/models/Settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const History(),
    const MyHomePage(),
    const Bookings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return _screens[_currentIndex];
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("LuxeLooks Cosmetics"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.0,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w500),
        clipBehavior: Clip.hardEdge,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const SettingsPage();
                }));
              },
              icon: const Icon(Icons.shopping_cart, color: Colors.white)),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const Notifications();
                }));
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const Drawer(backgroundColor: Colors.white, child: MainDrawer()),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 75, 73, 73),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.recommend),
            label: 'Last Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_mini_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate_sharp, color: Colors.amber),
            label: 'Favourites',
          ),
        ],
      ),
      body: Container(
        child: const DashScreen(),
      ),
    );
  }
}

class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
