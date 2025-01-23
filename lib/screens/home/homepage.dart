import 'package:flutter/material.dart';
import 'package:she_wellness_app/screens/message_page.dart';
import 'package:she_wellness_app/screens/wishlist_page.dart';
import 'package:she_wellness_app/screens/education.dart';
import 'package:she_wellness_app/screens/faq/faq_screen.dart';
import 'package:she_wellness_app/screens/profile/profile.dart';
import 'package:she_wellness_app/screens/profile/testimonials.dart';
import 'package:she_wellness_app/about_us_page.dart';
import 'package:she_wellness_app/screens/logout.dart';
import 'package:she_wellness_app/screens/home/booking.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _searchQuery = "";

  // List of classes with title, image path, and price
  final List<Map<String, dynamic>> _classes = [
    {"title": "Yoga Session", "image": "assets/yoga2.jpg", "price": 250.0},
    {"title": "Eat Healthy Session", "image": "assets/eating-healthy.jpg", "price": 140.0},
    {"title": "Pilates Session", "image": "assets/pilate2.jpg", "price": 200.0},
    {"title": "Mental Health Session", "image": "assets/mental-health.jpg", "price": 150.0},
  ];



  // Filtered list based on search query
  List<Map<String, dynamic>> get _filteredClasses {
    if (_searchQuery.isEmpty) {
      return _classes;
    }
    return _classes
        .where((classItem) =>
            classItem["title"]!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Stay on HomePage
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: Text(
          "Hello!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double containerWidth = constraints.maxWidth * 1;
          double headerFontSize = screenWidth > 600 ? 24 : 18;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.pink,
                  width: containerWidth,
                  child: Text(
                    "Making life healthier, One step at a time.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: headerFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    onChanged: (query) {
                      setState(() {
                        _searchQuery = query;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "What would you like to search?",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth > 600 ? 3 : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: _filteredClasses.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final classItem = _filteredClasses[index];
                    return _buildSessionCard(
                      classItem["title"]!,
                      classItem["image"]!,
                      (classItem["price"]! as num).toDouble(), // Tukar jenis int kepada double
                      constraints,
                    );


                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildSessionCard(
      String title, String imagePath, double price, BoxConstraints constraints) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingScreen(sessionName: title, price: price),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "RM $price per month",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Book Now Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(sessionName: title, price: price),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF85C70),
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text("Book Now", style: TextStyle(color: Colors.white)),
                ),
                // Love Icon (non-functional)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.favorite_border, // Heart icon (non-functional)
                    color: Colors.pink,
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "User Menu",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            accountEmail: Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: ClipOval(
                child: Image.asset(
                  'assets/profileimg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.pink),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Home"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text("Wellness Education"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EducationPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer_outlined),
            title: Text("FAQs"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.reviews_outlined),
            title: Text("Testimonials"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestimonialsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.phone_outlined),
            title: Text("About Us"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogoutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
