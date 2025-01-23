import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
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
      initialRoute: '/education',
      routes: {
        '/education': (context) => EducationPage(),
        '/home': (context) => HomePage(),
        '/message': (context) => MessagePage(),
        '/wishlist': (context) => WishlistPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class EducationPage extends StatelessWidget {
  final int _selectedIndex = 0;

  // Navigation logic for bottom navigation bar
  void _onItemTapped(BuildContext context, int index) {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0, // Hides the AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with a back button
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/header_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 90,
                    left: 5,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context); // Navigate back to the previous screen
                          },
                        ),
                        Text(
                          "Education is empowerment",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Cards Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(4, (index) => buildCard(index, context)),
              ),
            ),
          ],
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

  Widget buildCard(int index, BuildContext context) {
    // Data for each card
    final List<Map<String, String>> cardData = [
      {
        "title": "A Complete Guide on How to Eat Healthy and Balanced Diet",
        "description": "Learn about balanced diets, essential nutrients, and healthy eating habits.",
        "image": "assets/images/diet.png",
        "videoUrl": "assets/videos/diet_video.MP4",
        "extraExplanation": "Nutrition is crucial for maintaining a healthy lifestyle. A balanced diet provides the body with essential nutrients, vitamins, and minerals needed for growth, energy, and overall well-being.",
      },
      {
        "title": "How to Maintain Mental Health: Tips and Strategies",
        "description": "Explore resources for stress management, mental well-being, and emotional health.",
        "image": "assets/images/mental_health.jpg",
        "videoUrl": "assets/videos/mental_health_video.MP4",
        "extraExplanation": "Mental health is essential for overall well-being, encompassing emotional, psychological, and social aspects of our lives. Taking proactive steps to care for your mental health can significantly enhance your quality of life.",
      },
      {
        "title": "A Complete Guide to Staying Fit",
        "description": "Discover exercise routines, physical activity tips, and their benefits.",
        "image": "assets/images/fitness.jpg",
        "videoUrl": "assets/videos/fitness_video.MOV",
        "extraExplanation": "This guide focuses on both cardio and strength exercises for overall fitness.",
      },
      {
        "title": "How to Strengthen Your Immune System?",
        "description": "Get information on boosting your immunity.",
        "image": "assets/images/immune_system.jpg",
        "videoUrl": "assets/videos/immune_system_video.MP4",
        "extraExplanation": "The immune system plays a vital role in defending the body against infections and diseases. Maintaining a strong immune system is crucial for overall health.",
      },
    ];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(
              cardData[index]["image"]!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardData[index]["title"]!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    cardData[index]["description"]!,
                    style: TextStyle(color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            title: cardData[index]["title"]!,
                            description: cardData[index]["description"]!,
                            videoUrl: cardData[index]["videoUrl"]!,
                            headerImage: cardData[index]["image"]!,
                            extraExplanation: cardData[index]["extraExplanation"]!,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text("Learn More"),
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

class DetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final String videoUrl;
  final String headerImage;
  final String extraExplanation;

  DetailsPage({
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.headerImage,
    required this.extraExplanation,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      }).catchError((e) {
        print('Error loading video: $e');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This will navigate back to the EducationPage
          },
        ),
        title: Text(widget.title),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(widget.headerImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 24),
            Text(
              "Extra Explanation:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.extraExplanation,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 24),
            Text(
              "Watch the video below for more details:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Center(child: CircularProgressIndicator()),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
