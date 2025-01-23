import 'package:flutter/material.dart';
import 'package:she_wellness_app/screens/home/homepage.dart';

class HistoryPage extends StatefulWidget {
  final Map<String, dynamic>? newSession;

  HistoryPage({this.newSession});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<Map<String, dynamic>> sessions = [
    {
      'date': '11th December 2024',
      'session': 'Pilates',
      'duration': '3 months',
      'price': 'RM 600',
      'review': '',
      'image': 'assets/images/pilates.png',
      'rating': 0, // Initial rating for this session
    },
    {
      'date': '10th April 2024',
      'session': 'Mental Health',
      'duration': '1 month',
      'price': 'RM 150',
      'review':
          'I appreciated the safe and welcoming environment you created. It made it easier for everyone to open up and share their thoughts.',
      'image': 'assets/images/mental_health.jpg',
      'rating': 4, // Rating for this session (4 stars)
    },
  ];

  void initState() {
    super.initState();
    // Add the new session if passed
    if (widget.newSession != null) {
      sessions.insert(0, widget.newSession!); // Add to the top of the list
    }
  }

  void updateSessionReview(int index, String review, int rating) {
    setState(() {
      sessions[index]['review'] = review;
      sessions[index]['rating'] = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous page
          },
        ),
        title: Text('History'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final session = sessions[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                session['image']!,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date: ${session['date']}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Session: ${session['session']}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Duration: ${session['duration']}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Total Price: ${session['price']}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        if (session['review']!.isNotEmpty) ...[
                          Text(
                            'Review:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            session['review']!,
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < session['rating']
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.yellow,
                              );
                            }),
                          ),
                        ],
                        if (session['review']!.isEmpty)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReviewPage(
                                      index: index,
                                      session: session['session']!,
                                      image: session['image']!,
                                      onSubmit: updateSessionReview,
                                    ),
                                  ),
                                );
                              },
                              child: Text('To Review'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.pink),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Navigate to the homepage
                );
              },
              child: Text('Go to Homepage'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewPage extends StatefulWidget {
  final int index;
  final String session;
  final String image;
  final Function(int, String, int) onSubmit;

  ReviewPage({
    required this.index,
    required this.session,
    required this.image,
    required this.onSubmit,
  });

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int _selectedStars = 0; // Tracks the number of selected stars
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review',
          style: TextStyle(color: Colors.white), // Sets the title text color to white
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.session} Session:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.asset(
              widget.image,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Write a review',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    _selectedStars > index
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedStars = index + 1; // Update the rating
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Share more thoughts on the session',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.onSubmit(
                    widget.index,
                    _reviewController.text,
                    _selectedStars,
                  );
                  Navigator.pop(context);
                },
                child: Text('Submit'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: HistoryPage()));
