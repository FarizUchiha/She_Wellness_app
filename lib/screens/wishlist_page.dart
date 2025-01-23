import 'package:flutter/material.dart';
import 'package:she_wellness_app/screens/home/homepage.dart';
import 'package:she_wellness_app/screens/home/payment.dart';
import 'package:she_wellness_app/screens/message_page.dart';
import 'package:she_wellness_app/screens/profile/profile.dart'; // Import the payment screen

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int _selectedIndex = 2; // Set the default to Wishlist (index 2)

  // Dummy wishlist data
  List<Map<String, dynamic>> wishlist = [
    {
      "title": "Mental Health Session",
      "details": "Duration: 1 month\nPrice: RM150",
      "price": 150.0,  // Add price field
      "imagePath": "assets/mentalheal.jpg",
    },
    {
      "title": "Yoga Class",
      "details": "Duration: 1 month\nPrice: RM250",
      "price": 250.0,  // Add price field
      "imagePath": "assets/yoga.jpg",
    },
    {
      "title": "Pilates Class",
      "details": "Duration: 2 months\nPrice: RM400",
      "price": 400.0,  // Add price field
      "imagePath": "assets/pilates.jpg",
    },
  ];

  void removeItem(int index) {
    setState(() {
      wishlist.removeAt(index);
    });
  }

  // Navigation logic for bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));  // Correct route for HomePage
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage()));  // Correct route for MessagePage
        break;
      case 2:
        // Stay on Wishlist
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())); // Correct route for ProfilePage
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFF85C70),
        centerTitle: true,
      ),
      body: wishlist.isEmpty
          ? Center(
              child: Text(
                "Your wishlist is empty!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final item = wishlist[index];
                return Center(
                  child: Container(
                    width: 350,  // Set a fixed width for the card container
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.asset(
                              item["imagePath"],
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Text(
                                  item["title"],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF85C70),
                                  ),
                                ),
                                SizedBox(height: 8),
                                // Details
                                Text(
                                  item["details"],
                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Book Now Button
                                    ElevatedButton(
                                      onPressed: () {
                                        // Navigate to the payment page
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PaymentScreen(
                                              sessionName: item["title"],
                                              totalPrice: item["price"],
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFF85C70),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text("Book Now"),
                                    ),
                                    // Remove Button
                                    IconButton(
                                      icon: Icon(Icons.close, color: Colors.red),
                                      onPressed: () => removeItem(index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Highlight the selected tab
        onTap: _onItemTapped, // Handle tab selection
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
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
