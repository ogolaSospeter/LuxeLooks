import 'package:flutter/material.dart';
import 'package:luxelooks/Screens/Dash.dart';
import 'package:luxelooks/displays/cards/new_booking.dart';
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
    const Notifications(),
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
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w500),
        clipBehavior: Clip.hardEdge,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const SettingsPage();
                }));
              },
              icon: const Icon(Icons.payment)),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const Notifications();
                }));
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
      ),
      drawer: const Drawer(backgroundColor: Colors.white, child: MainDrawer()),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return const NewBooking();
          }));
        },
        elevation: 3.0,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 20.0),
            Text(
              "Add",
              style: TextStyle(fontSize: 10.0),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 75, 73, 73),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'History ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.holiday_village),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_task), label: "Bookings")
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
