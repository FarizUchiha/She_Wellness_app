import 'package:flutter/material.dart';
import 'package:she_wellness_app/screens/message_page.dart';
import 'package:she_wellness_app/screens/wishlist_page.dart';
import 'package:she_wellness_app/screens/profile/profile.dart';
import 'package:she_wellness_app/screens/home/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/testimonials',
      routes: {
        '/testimonials': (context) => TestimonialsPage(),
        '/home': (context) => HomePage(),
        '/message': (context) => MessagePage(),
        '/wishlist': (context) => WishlistPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class TestimonialsPage extends StatefulWidget {
  @override
  _TestimonialsPageState createState() => _TestimonialsPageState();
}

class _TestimonialsPageState extends State<TestimonialsPage> {
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

  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Umairah Husna',
      'image': 'assets/user1.jpg', // Local asset image
      'rating': 4,
      'comment': 'Amazing service! Highly recommend to others.',
    },
    {
      'name': 'Anis Diana',
      'image': 'assets/user2.jpg', // Local asset image
      'rating': 5,
      'comment': 'Exceeded my expectations. Will come back again.',
    },
    {
      'name': 'Tiara Lee',
      'image': 'assets/user3.jpg', // Local asset image
      'rating': 3,
      'comment': 'Good service, but there is room for improvement.',
    },
    {
      'name': 'Hanania Laura',
      'image': 'assets/user4.jpg', // Local asset image
      'rating': 5,
      'comment': 'The instructor is very helpful and guideful.',
    },
    {
      'name': 'Liana Najwa',
      'image': 'assets/user5.jpg', // Local asset image
      'rating': 5,
      'comment': 'Pilates class is very interesting and good environment.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testimonials'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: testimonials.length,
          itemBuilder: (context, index) {
            final testimonial = testimonials[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestimonialDetailPage(testimonial: testimonial),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(testimonial['image']), // Local image
                        radius: 30,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              testimonial['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: List.generate(5, (starIndex) {
                                return Icon(
                                  Icons.star,
                                  color: starIndex < testimonial['rating']
                                      ? Colors.pink
                                      : Colors.grey,
                                  size: 20,
                                );
                              }),
                            ),
                            SizedBox(height: 8),
                            Text(
                              testimonial['comment'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14),
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
}

class TestimonialDetailPage extends StatelessWidget {
  final Map<String, dynamic> testimonial;

  TestimonialDetailPage({required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testimonial Detail'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(testimonial['image']), // Local image
                radius: 50,
              ),
            ),
            SizedBox(height: 16),
            Text(
              testimonial['name'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: List.generate(5, (starIndex) {
                return Icon(
                  Icons.star,
                  color: starIndex < testimonial['rating'] ? Colors.pink : Colors.grey,
                  size: 24,
                );
              }),
            ),
            SizedBox(height: 16),
            Text(
              testimonial['comment'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
