import 'package:flutter/material.dart';
import 'add_page.dart'; // Import pages
import 'view_all_page.dart';
import 'settings_page.dart';
import 'communities_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 cards per row
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            buildCard(
              context,
              title: 'Add',
              icon: Icons.add,
              color: Colors.blue,
              navigateTo: AddPage(),
            ),
            buildCard(
              context,
              title: 'View All',
              icon: Icons.view_list,
              color: Colors.blue,
              navigateTo: ViewAllPage(),
            ),
            buildCard(
              context,
              title: 'Settings',
              icon: Icons.settings,
              color: Colors.blue,
              navigateTo: SettingsPage(),
            ),
            buildCard(
              context,
              title: 'Communities',
              icon: Icons.people,
              color: Colors.blue,
              navigateTo: CommunitiesPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget navigateTo}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo),
        );
      },
      child: Card(
        color: Colors.white, // Background color set to white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8, // Increase elevation for shadow effect
        shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8, // Blurring for a softer shadow
                offset: Offset(4, 4), // Offset to create 3D depth
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // Background color of icon container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white, // Soft shadow
                        blurRadius: 6,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16), // Padding for icon
                  child: Icon(icon, size: 48, color: color), // Icon styling
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.black, // Use black text for better readability
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
