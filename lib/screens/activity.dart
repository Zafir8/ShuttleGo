import 'package:flutter/material.dart';
import 'RideSelection.dart';
import 'home.dart'; 
import 'profile.dart';
import 'ride.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Activity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ActivityPage(),
    );
  }
}

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int _selectedIndex = 2; // This is the index of the current page in the BottomNavigationBar.

  final List<Map<String, dynamic>> activities = [
    {
      'icon': Icons.directions_bus,
      'location': 'Royal College',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },
    {
      'icon': Icons.directions_car,
      'location': 'Gateway College',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },
    {
      'icon': Icons.directions_bus,
      'location': 'Lyceum International School',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },
    {
      'icon': Icons.directions_car,
      'location': 'British School in Colombo',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },
    {
      'icon': Icons.directions_bus,
      'location': 'Elizabeth Moir School',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },

    {
      'icon': Icons.directions_car,
      'location': 'Stafford International School',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },
    {
      'icon': Icons.directions_bus,
      'location': 'Asian International School',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },
    {
      'icon': Icons.directions_car,
      'location': 'Colombo International School',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },

    {
      'icon': Icons.directions_bus,
      'location': 'Ladies College',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },
    {
      'icon': Icons.directions_car,
      'location': 'Bishops College',
      'date': 'Feb 5 - 8:01 AM',
      'price': 'LKR244.19',
      'status': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        titleTextStyle: const TextStyle(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('Activity'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          var activity = activities[index];
          return Card(
            child: ListTile(
              leading: Icon(activity['icon']),
              title: Text(activity['location']),
              subtitle: Text('${activity['date']} - ${activity['status']}'),
              trailing: Wrap(
                spacing: 12, // Space between two icons
                children: <Widget>[
                  activity['status'] == 'Completed'
                      ? TextButton(
                          onPressed: () {
                            // Rate action
                          },
                          child: Text('Rate'),
                        )
                      : SizedBox(), // Empty box for spacing
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RideSelectionPage()),
                      );
                      
                    },
                    child: Text('Rebook'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        currentIndex: _selectedIndex,
        onTap: (int index) {
          if (index != _selectedIndex) {
            setState(() {
              _selectedIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                break;
              case 1:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BookRidePage()),
                );
                break;
              case 3:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
                break;
            }
          }
        },
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
      ),
    );
  }
}
