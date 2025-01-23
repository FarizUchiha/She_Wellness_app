import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Support',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Title
            Text(
              'How-To Guides',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Guide 1: How to give reviews
            ListTile(
              leading: Icon(Icons.star, color: Colors.pink),
              title: Text(
                'How to give reviews or ratings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                'Learn how to submit a review and rate your sessions.',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewGuidePage()),
                );
              },
            ),
            Divider(),

            // Guide 2: How to access history
            ListTile(
              leading: Icon(Icons.history, color: Colors.pink),
              title: Text(
                'How to access your session history',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                'View your past sessions, reviews, and more.',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryGuidePage()),
                );
              },
            ),
            Divider(),

            // Guide 3: How to book a session
            ListTile(
              leading: Icon(Icons.event, color: Colors.pink),
              title: Text(
                'How to book a session',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                'Follow these steps to book a session with us.',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingGuidePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Guide for booking a session
class BookingGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to Book a Session',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Steps to Book a Session:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('1. Tap the "Book Now" button on the HomePage.'),
            SizedBox(height: 5),
            Text('2. Choose the desired duration of your session in months.'),
            SizedBox(height: 5),
            Text('3. Select your session\'s start date and end date.'),
            SizedBox(height: 5),
            Text('4. After selecting the dates, tap the "Pay" button to proceed to payment.'),
            SizedBox(height: 5),
            Text('5. Choose your preferred payment method and complete the payment.'),
            SizedBox(height: 5),
            Text(
              '6. Once the payment is confirmed,you will directly go to history page to see your booked sessions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Guide for reviewing
class ReviewGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to Review',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Steps to Give a Review',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('1. Go to the "History" page.'),
            SizedBox(height: 5),
            Text('2. Find the session you want to review.'),
            SizedBox(height: 5),
            Text(
                '3. If you haven\'t reviewed the session yet, tap the "To Review" button.'),
            SizedBox(height: 5),
            Text(
                '4. On the review page, select a rating (1-5 stars) and write your thoughts.'),
            SizedBox(height: 5),
            Text('5. Tap "Submit" to save your review.'),
          ],
        ),
      ),
    );
  }
}

// Guide for accessing history
class HistoryGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to Access History',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Steps to View Your History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('1. Open the "History" page from the main menu.'),
            SizedBox(height: 5),
            Text('2. Browse through the list of your past sessions.'),
            SizedBox(height: 5),
            Text('3. You can see session details, including:'),
            Text('   - Date, session type, and duration'),
            Text('   - Total price'),
            Text('   - Review (if available)'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HelpSupportPage()));
}
