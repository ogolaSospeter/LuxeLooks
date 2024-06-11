import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Notifications"),
        elevation: 2.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50.0,
            ),
            const Text(
                'Your Notifications for booked jobs Should Appear Here.\n'),
            Image.network(
              "https://img.freepik.com/premium-vector/faceless-girl-whips-out-reconciles-dress-via-mobile-app-people-ordering-online-store-smartphone-screen-color-2d-graphic-vector-flat-style-illustration_776652-3071.jpg?w=740",
              height: 300,
              width: 300,
            ),
            const Text(
              'Seems You have no current Job Bookings.',
              style: TextStyle(
                  fontSize: 10.5,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
