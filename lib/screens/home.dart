import 'package:flutter/material.dart';
import 'ride.dart';
import 'profile.dart';
import 'activity.dart'; 
import 'RideSelection.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Example list of destinations
  final List<Map<String, String>> destinations = [
    {
      'name': 'Readway school',
      'address': 'Baseline Road, Colombo, Sri Lanka'
    },
    {
      'name': 'Royal College',
      'address': 'Colombo – Galle Main Road, Colombo, Sri Lanka'
    },
    {
      'name': 'Colombo International School',
      'address': 'Sir James Pieris Mawatha, Colombo, Sri Lanka'
    },
    {
      'name': 'Gateway college',
      'address': 'R. A. De Mel Mawatha, Colombo, Sri Lanka'
    },
    {
      'name': 'Lyceum International School',
      'address': 'Galle Road, Colombo, Sri Lanka'
    },
    {
      'name': 'British School in Colombo',
      'address': 'Galle Road, Colombo, Sri Lanka'
    },
    {
      'name': 'Elizabeth Moir School',
      'address': 'Galle Road, Colombo, Sri Lanka'
      
    }
  
  
  ];

  // Icons
  final List<IconData> itemIcons = [
    Icons.directions_bus, // Bus icon
    Icons.directions_car, // Van icon
    Icons.family_restroom, // Parent icon
    Icons.help_outline, // Help icon
    Icons.contact_phone, // Contact icon
    Icons.payment, // Pay icon
  ];

  @override
  Widget build(BuildContext context) {
    // the icon color based on the theme brightness
    final Color iconColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        titleTextStyle: const TextStyle(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Good Afternoon, Zafir!'),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(itemIcons.length, (index) {
                  return Card(
                    elevation: 2,
                    child: Center(
                      child: Icon(
                        itemIcons[index],
                        size: 40.0,
                        color: iconColor,
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Destination!',
                  prefixIcon: Icon(Icons.search, color: iconColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_on, color: iconColor),
                  title: Text(destinations[index]['name'] ?? 'Destination'),
                  subtitle: Text(destinations[index]['address'] ?? 'Address'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RideSelectionPage()),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        items: [
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
        onTap: (int index) {
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookRidePage()),
              );
              break;
            case 2:
              // Navigate to Activity page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityPage()),
              );
              break;
            case 3:
              // Navigate to Profile page
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

