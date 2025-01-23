import 'package:flutter/material.dart';
import 'instructor_profile/instructor1.dart';
import 'instructor_profile/instructor2.dart';
import 'instructor_profile/instructor3.dart';
import 'instructor_profile/instructor4.dart';
import 'location_details/location1.dart';
import 'location_details/location2.dart';
import 'location_details/location3.dart';


class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  int _selectedIndex = 0;

  // Navigation logic for bottom navigation bar
  void _onItemTapped(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/message');
        break;
      case 2:
        Navigator.pushNamed(context, '/wishlist');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          ],
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/header_background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(color: Colors.black.withOpacity(0.5)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Welcome to SHE Healthcare!\nYour all-in-one wellness hub, built for women to thrive.\nEmpowering you to live healthier, happier, and unstoppable.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Instructor Section
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  decoration: BoxDecoration(
                    color: Color(0xFFF85C70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Instructor",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      instructorWidget(
                        context,
                        "Anne Johnson",
                        "assets/instructor2.jpg",
                        Instructor1Page(),
                      ),
                      instructorWidget(
                        context,
                        "Layla Lee",
                        "assets/instructor1.jpg",
                        Instructor2Page(),
                      ),
                      instructorWidget(
                        context,
                        "Sophia Lim",
                        "assets/instructor3.jpg",
                        Instructor3Page(),
                      ),
                      instructorWidget(
                        context,
                        "Karina Yu",
                        "assets/instructor4.jpg",
                        Instructor4Page(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Locations Section
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  decoration: BoxDecoration(
                    color: Color(0xFFF85C70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Locations",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Wellness Near You - Visit Us In:",
                style: TextStyle(
                  color: Color(0xFFF85C70),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              locationRowWidget(
                "assets/location1.jpg",
                "Wellness Hub Batu Pahat",
                "Monday-Friday, 8am-5pm",
                Location1Page(),
                context,
              ),
              locationRowWidget(
                "assets/location2.jpg",
                "Unique Plus Gym",
                "Monday-Sunday, 8am-11pm",
                Location2Page(),
                context,
              ),
              locationRowWidget(
                "assets/location3.jpg",
                "Coop UTHM Gym & Fitness Centre",
                "Monday-Sunday (except Friday), 3pm-10pm",
                Location3Page(),
                context,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Highlight the selected tab
        onTap: (index) => _onItemTapped(context, index), // Handle tab selection
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget instructorWidget(BuildContext context, String name, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF85C70),
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFF85C70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget locationRowWidget(String imagePath, String locationName, String openingHours, Widget page, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                width: 200,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locationName,
                      style: TextStyle(
                        color: Color(0xFFF85C70),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      openingHours,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF85C70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Direction"),
            ),
          ),
        ],
      ),
    );
  }
}
