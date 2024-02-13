import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ride Selection Page',
      // Theme settings...
      home: RideSelectionPage(),
    );
  }
}

class RideSelectionPage extends StatelessWidget {
  void _showBookingConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Booking Confirmation'),
          content: const Text('Your driver is on the way!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        titleTextStyle: const TextStyle(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Choose a ride'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/google.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Bus', style: TextStyle(color: Colors.white)),
                    subtitle: const Text('07:43 - 4 min away', style: TextStyle(color: Colors.white70)),
                    trailing: const Text('LKR 545.27', style: TextStyle(color: Colors.white)),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.directions_bus, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _showBookingConfirmation(context);
                      },
                      child: const Text('Choose Bus'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                         primary: const Color.fromARGB(255, 0, 13, 79),
                         onPrimary: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
