import 'package:flutter/material.dart';
import 'package:she_wellness_app/screens/message_page.dart';
import 'package:she_wellness_app/screens/wishlist_page.dart';
import 'package:she_wellness_app/screens/profile/profile.dart';
import 'package:she_wellness_app/screens/home/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/faq_screen',
      routes: {
        '/faq_screen': (context) => FAQScreen(),
        '/home': (context) => HomePage(),
        '/message': (context) => MessagePage(),
        '/wishlist': (context) => WishlistPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  int _selectedIndex = 0;

  // List of questions and answers
  final List<Map<String, dynamic>> faqs = [
    {
      'question': 'What is SHE Wellness, and how does it work?',
      'answer': 'SHE Wellness is a platform for booking wellness services. It connects users with practitioners for personalized sessions.',
      'isExpanded': false,
    },
    {
      'question': 'What types of wellness services can I book through the app?',
      'answer': 'You can book yoga, meditation, fitness coaching, therapy sessions, and more.',
      'isExpanded': false,
    },
    {
      'question': 'How do I sign up and create an account?',
      'answer': 'Simply navigate to the sign-up page, enter your details, and follow the instructions to verify your email.',
      'isExpanded': false,
    },
    {
      'question': 'How do I book a session with a wellness practitioner?',
      'answer': 'Browse available practitioners, select a time slot, and confirm your booking.',
      'isExpanded': false,
    },
    {
      'question': 'Is my personal and payment information secure?',
      'answer': 'Yes, we use advanced encryption to ensure all your personal and payment data is secure.',
      'isExpanded': false,
    },
  ];

  // Variable to store the search query
  String searchQuery = '';

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
    // Filter FAQs based on the search query
    final filteredFaqs = faqs
        .where((faq) => faq['question'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6F91),
        elevation: 0,
        title: Text('FAQs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Looking for something specific?',
                prefixIcon: Icon(Icons.search, color: Color(0xFFFF6F91)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredFaqs.isEmpty
                ? Center(
                    child: Text(
                      'No results found for "$searchQuery".',
                      style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredFaqs.length,
                    itemBuilder: (context, index) {
                      final faq = filteredFaqs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  faq['question'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                trailing: Icon(
                                  faq['isExpanded'] ? Icons.expand_less : Icons.expand_more,
                                  color: Color(0xFFFF6F91),
                                ),
                                onTap: () {
                                  setState(() {
                                    faq['isExpanded'] = !faq['isExpanded'];
                                  });
                                },
                              ),
                              if (faq['isExpanded'])
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  child: Text(
                                    faq['answer'],
                                    style: TextStyle(color: Colors.grey.shade700),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
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
