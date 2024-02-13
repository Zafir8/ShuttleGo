import 'package:flutter/material.dart';
import 'RideSelection.dart'; 
import 'activity.dart'; 
import 'profile.dart'; 
import 'home.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book a Ride',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: Colors.grey,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      home: BookRidePage(),
    );
  }
}

class BookRidePage extends StatefulWidget {
  @override
  _BookRidePageState createState() => _BookRidePageState();
}

class _BookRidePageState extends State<BookRidePage> {
  int _selectedIndex = 1; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        titleTextStyle: const TextStyle(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('Book a Ride'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle add action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Home',
                prefixIcon: Icon(Icons.home),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Where to?',
                prefixIcon: Icon(Icons.location_pin),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Saved places'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Asia Pacific Institute of Information Technology'),
                    subtitle: Text('No. 388 Union Pl, Colombo'),
                  ),
                  
                ],
              ).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RideSelectionPage()),
                );
              },
              child: Text('Confirm Ride'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // width and height
                primary: const Color.fromARGB(255, 0, 13, 79),
                onPrimary: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityPage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }
}

